{-# LANGUAGE OverloadedStrings #-}
{-|
Module          : Pangraph.Gml.Parser
Description     : Parse gml files

Functions for parseing gml (Graphical Modelling Language) files.
A gml specification can be found at:
<http://www.fim.uni-passau.de/fileadmin/files/lehrstuhl/brandenburg/projekte/gml/gml-technical-report.pdf>.

This follows the specification except for two cases:

    1. All files are assumed to be encoded in UTF8
    
    2. The line length limit is ignored
-}
module Pangraph.Gml.Parser (parse, parseGml, decode, gmlToPangraph) where

import Data.Attoparsec.Text hiding (parse)
import Data.Attoparsec.Combinator (lookAhead)
import Data.Text (Text, cons, pack, lines, unlines, isPrefixOf)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Data.Text.Lazy.Builder (toLazyText)
import Data.Text.Lazy (toStrict)
import Control.Applicative ((<|>), (<*))
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.Maybe
import HTMLEntities.Decoder (htmlEncodedText)
import Prelude hiding (takeWhile, id, lines, unlines)

import Pangraph
import Pangraph.Gml.Ast

-- | Parses the 'ByteString' into a 'Pangraph'
parse :: B.ByteString -> Maybe Pangraph
parse contents = fmap decode (parseGml contents) >>= gmlToPangraph

-- | Parses the 'ByteString' into a 'Gml' ast. The function doesn't decode
-- special characters inside strings. To decode special characters inside strings 
-- use the 'decode' function.
parseGml :: B.ByteString -> Maybe (Gml Text)
parseGml contents = either (const Nothing) Just 
    (parseText (decodeUtf8 contents))

parseText :: Text -> Either String (Gml Text)
parseText = parseOnly (gmlParser <* endOfInput) . removeComments

-- | Decodes special characters inside gml strings
decode :: Gml Text -> Gml Text
decode = mapStrings (toStrict . toLazyText . htmlEncodedText)

removeComments :: Text -> Text
removeComments text = unlines (filter (not . isPrefixOf "#") (lines text))

-- | Converts a gml ast into a pangraph. If a node/edge contains a gml object
-- these object are not contained in the resulting pangraph. Are other values
-- are.
gmlToPangraph :: Gml Text -> Maybe Pangraph
gmlToPangraph gml = do
    graphObj <- lookupValue gml "graph"
    values <- objectValues graphObj
    let vertices = map snd (filter (\(k, _) -> k == "node") values)
    let edges = map snd (filter (\(k, _) -> k == "edge") values)
    let pVertices = mapMaybe gmlToVertex vertices
    verticeGraph <- makePangraph pVertices []
    let pEdges = mapMaybe (gmlToEdge verticeGraph) edges
    makePangraph pVertices pEdges

gmlToEdge :: Pangraph -> Gml Text -> Maybe Edge
gmlToEdge graph gml = do
    sourceV <- lookupValue gml "source"
    targetV <- lookupValue gml "target"
    source <- integerValue sourceV
    target <- integerValue targetV
    atts <- attrs gml
    let sourceB = encodeUtf8 (pack (show source))
    let targetB = encodeUtf8 (pack (show target))
    sourceVertex <- lookupVertex sourceB graph
    targetVertex <- lookupVertex targetB graph
    return (makeEdge atts (sourceVertex, targetVertex))

gmlToVertex :: Gml Text -> Maybe Vertex
gmlToVertex gml = do
    idV <- lookupValue gml "id"
    id <- integerValue idV
    atts <- attrs gml
    let bid = BC.pack (show id)
    return (makeVertex bid atts)

attrs :: Gml Text -> Maybe [(B.ByteString, B.ByteString)]
attrs gml = mapMaybe convertValue <$> objectValues gml
    
convertValue :: (Text, Gml Text) -> Maybe (B.ByteString, B.ByteString)
convertValue (k, Integer i) = Just (encodeUtf8 k, BC.pack (show i))
convertValue (k, Float d) = Just (encodeUtf8 k, BC.pack (show d))
convertValue (k, String s) = Just (encodeUtf8 k, encodeUtf8 s)
convertValue _ = Nothing

gmlParser :: Parser (Gml Text)
gmlParser = innerListParser

listParser :: Parser (Gml Text)
listParser = do
    skipSpace
    skip (inClass "[")
    obj <- innerListParser
    skipSpace
    skip (inClass "]")
    skipSpace
    return obj

innerListParser :: Parser (Gml Text)
innerListParser = Object <$> many' listEntryParser

listEntryParser :: Parser (Text, Gml Text)
listEntryParser = do
    skipSpace
    name <- key
    skipMany1 whitespace
    value <- valueParser
    return (name, value)
    
key :: Parser Text
key = do
    start <- satisfy (inClass "a-zA-Z")
    rest <- takeWhile (inClass "a-zA-Z0-9")
    return (start `cons` rest)

valueParser :: Parser (Gml Text)
valueParser = stringParser <|> integerParser <|> floatParser <|> listParser

integerParser :: Parser (Gml Text)
integerParser = do
    i <- signed decimal
    _ <- lookAhead (notChar '.')
    return (Integer i)

floatParser :: Parser (Gml Text)
floatParser = Float <$> double

stringParser :: Parser (Gml Text)
stringParser = do 
    let del = inClass "\""
    skip del
    s <- takeTill del
    skip del
    return (String s)
     
whitespace :: Parser ()
whitespace = skip isHorizontalSpace <|> endOfLine

