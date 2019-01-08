{-# LANGUAGE OverloadedStrings #-}
{-|
Module          : Pangraph.Pajek.Parser
Description     : Parse pajek (.net) files

Functions for parseing pajek files.
Roughly follows the specification at <https://gephi.org/users/supported-graph-formats/pajek-net-format/>

All input is assumed to be encoded in UTF8
-}
module Pangraph.Pajek.Parser (parse, parsePajek, pajekToPangraph) where

import Data.Attoparsec.Text hiding (parse)
import qualified Data.Text as T
import Data.Text.Encoding (decodeUtf8)
import Control.Applicative ((<|>), (<*))
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.Text.Encoding as EC
import Data.Char (isSpace)
import Prelude hiding (takeWhile, id, lines, unlines, reverse)

import qualified Pangraph as P
import Pangraph.Pajek.Ast

-- | Parses the 'ByteString' into a 'Pangraph'.
--   Please note that this function treats directed and undirected edges in same
--   way. So if the panjek file contains an arc (undirected edge) between node 1
--   and node 2 the resulting pangraph will only contain an edge between 1 and 2.
parse :: B.ByteString -> Maybe P.Pangraph
parse contents = (parsePajek contents) >>= pajekToPangraph

-- | Converts a 'Pajek' into a 'Pangraph'
pajekToPangraph :: Pajek T.Text -> Maybe P.Pangraph
pajekToPangraph pajek = let
    pVertices = map (vertexToPangraph) (vertices pajek)
    pEdges = map (edgeToPangraph) (edges pajek)
    in P.makePangraph pVertices pEdges

vertexToPangraph :: Vertex T.Text -> P.Vertex
vertexToPangraph (vid, label') =
    P.makeVertex (BC.pack (show vid))
    (maybe [] (\l -> [("label", (EC.encodeUtf8 l))]) label')

edgeToPangraph :: Edge -> P.Edge
edgeToPangraph (Unweighted _ start end) =
    P.makeEdge (BC.pack (show start), BC.pack (show end)) []
edgeToPangraph (Weighted _ start end w) =
    P.makeEdge (BC.pack (show start), BC.pack (show end))
        [("weight", BC.pack (show w))]

-- | Parses the 'ByteString' into a 'Pajek' ast.
parsePajek :: B.ByteString -> Maybe (Pajek T.Text)
parsePajek contents = either (const Nothing) Just
      (parseText (decodeUtf8 contents))

parseText :: T.Text -> Either String (Pajek T.Text)
parseText = parseOnly (pajekParser <* endOfInput) . removeComments

removeComments :: T.Text -> T.Text
removeComments text = T.unlines (filter (not . T.isPrefixOf "%") (T.lines text))

pajekParser :: Parser (Pajek T.Text)
pajekParser = do
    gname <- option Nothing (fmap (Just) networkHeader)
    _ <- verticesHeader
    vs <- vertexList
    skipSpace
    edges' <- sepBy (choice [arcsAsPairs, arcsList, edgesAsPairs, edgesList])
        skipSpace
    _ <- manyTill (skipRest) endOfInput
    return (Graph gname vs (concat edges'))

networkHeader :: Parser (T.Text)
networkHeader = do
    star
    _ <- asciiCI "network"
    skipSpace
    gname <- fmap unquoted line
    endOfLine
    return gname

verticesHeader :: Parser Integer
verticesHeader = do
    star
    _ <- asciiCI "vertices"
    skipSpace
    n <- decimal
    skipRest
    return n

vertexList :: Parser [Vertex T.Text]
vertexList = sepBy vertexEntry endOfLine

vertexEntry :: Parser (Vertex T.Text)
vertexEntry = do
    skipSpace
    vid <- decimal
    skipSpace
    label' <- option Nothing $ fmap (Just) maybeQuoted
    _ <- line
    return (vid, label')

arcsAsPairs :: Parser [Edge]
arcsAsPairs = do
    star
    _ <- asciiCI "arcs"
    _ <- line
    endOfLine
    pairs <- sepBy (pair False) endOfLine
    return pairs

edgesAsPairs :: Parser [Edge]
edgesAsPairs = do
    star
    _ <- asciiCI "edges"
    skipRest
    pairs <- sepBy (pair True) endOfLine
    return pairs

edgesList :: Parser [Edge]
edgesList = do
    star
    _ <- asciiCI "edgeslist"
    skipRest
    adjacencyList True

arcsList :: Parser [Edge]
arcsList = do
    star
    _ <- asciiCI "arcslist"
    skipRest
    adjacencyList False

adjacencyList :: Bool -> Parser [Edge]
adjacencyList directed' = do
    edges' <- sepBy edgeList endOfLine
    let flatEdges = concatMap (\(s, tids) -> map (\t -> (s, t)) tids) edges'
    return (map (uncurry (Unweighted directed')) flatEdges)

edgeList :: Parser (Integer, [Integer])
edgeList = do
    _ <- option ' ' (char '-')
    sId <- decimal
    skipSpace1
    tIds <- sepBy decimal skipSpace1
    _ <- line
    return (sId, tIds)

pair :: Bool -> Parser Edge
pair directed' = do
    skipSpace
    source <- decimal
    _ <- skipSpace1
    target <- decimal
    edge <- option (Unweighted directed' source target)
                (fmap (Weighted directed' source target) edgeWeight)
    _ <- line
    return edge

edgeWeight :: Parser Double
edgeWeight = do
    _ <- skipSpace1
    w <- double
    return w

star :: Parser ()
star = skip (== '*')

line :: Parser T.Text
line = takeTill (isEndOfLine)

maybeQuoted :: Parser T.Text
maybeQuoted = quoted <|> (fmap unquoted (takeTill isSpace))

quoted :: Parser T.Text
quoted = do
    _ <- satisfy (== '\"')
    t <- takeTill (== '\"')
    _ <- satisfy (== '\"')
    return t

unquoted :: T.Text -> T.Text
unquoted = T.filter (/= '\"')

skipSpace1 :: Parser ()
skipSpace1 = do
    _ <- takeWhile1 isHorizontalSpace
    return ()

skipRest :: Parser ()
skipRest = do
    _ <- line
    endOfLine
