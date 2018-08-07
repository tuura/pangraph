{-# LANGUAGE OverloadedStrings #-}
module Pangraph.GML.Parser (parse, parseGml) where

import Data.Attoparsec.Text hiding (parse)
import Data.Text (Text, cons, pack, lines, unlines, isPrefixOf)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Data.Text.Lazy.Builder (toLazyText)
import Data.Text.Lazy (toStrict)
import Control.Applicative ((<|>), (<*))
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.Maybe
import HTMLEntities.Decoder (htmlEncodedText)
import Data.Bifunctor (second)
import Prelude hiding (takeWhile, id, lines, unlines)

import Pangraph
import Pangraph.GML.Ast

parse :: B.ByteString -> Maybe Pangraph
parse contents = parseGml contents >>= gmlToPangraph

parseGml :: B.ByteString -> Maybe (GML Text)
parseGml contents = either (const Nothing) Just 
    (second decodeHtmlEntities (parseText (decodeUtf8 contents)))

parseText :: Text -> Either String (GML Text)
parseText = parseOnly (gmlParser <* endOfInput) . removeComments

decodeHtmlEntities :: GML Text -> GML Text
decodeHtmlEntities = mapStrings (toStrict . toLazyText . htmlEncodedText)

removeComments :: Text -> Text
removeComments text = unlines (filter (not . isPrefixOf "#") (lines text))

gmlToPangraph :: GML Text -> Maybe Pangraph
gmlToPangraph gml = do
    graphObj <- lookupValue gml "graph"
    values <- objectValues graphObj
    let vertices = map snd (filter (\(k, _) -> k == "node") values)
    let edges = map snd (filter (\(k, _) -> k == "edge") values)
    let pVertices = mapMaybe gmlToVertex vertices
    verticeGraph <- makePangraph pVertices []
    let pEdges = mapMaybe (gmlToEdge verticeGraph) edges
    makePangraph pVertices pEdges

gmlToEdge :: Pangraph -> GML Text -> Maybe Edge
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

gmlToVertex :: GML Text -> Maybe Vertex
gmlToVertex gml = do
    idV <- lookupValue gml "id"
    id <- integerValue idV
    atts <- attrs gml
    let bid = BC.pack (show id)
    return (makeVertex bid atts)

attrs :: GML Text -> Maybe [(B.ByteString, B.ByteString)]
attrs gml = mapMaybe convertValue <$> objectValues gml
    
convertValue :: (Text, GML Text) -> Maybe (B.ByteString, B.ByteString)
convertValue (k, Integer i) = Just (encodeUtf8 k, BC.pack (show i))
convertValue (k, Float d) = Just (encodeUtf8 k, BC.pack (show d))
convertValue (k, String s) = Just (encodeUtf8 k, encodeUtf8 s)
convertValue _ = Nothing

gmlParser :: Parser (GML Text)
gmlParser = innerListParser

listParser :: Parser (GML Text)
listParser = do
    skipSpace
    skip (inClass "[")
    obj <- innerListParser
    skipSpace
    skip (inClass "]")
    skipSpace
    return obj

innerListParser :: Parser (GML Text)
innerListParser = Object <$> many' listEntryParser

listEntryParser :: Parser (Text, GML Text)
listEntryParser = do
    skipSpace
    name <- key
    skipMany1 whitespace
    value <- valueParser
    return (name, value)
    
key :: Parser Text
key = do
    start <- satisfy (inClass "a-z")
    rest <- takeWhile (inClass "a-zA-Z0-9")
    return (start `cons` rest)

valueParser :: Parser (GML Text)
valueParser = stringParser <|> integerParser <|> floatParser <|> listParser

integerParser :: Parser (GML Text)
integerParser = Integer <$> signed decimal

floatParser :: Parser (GML Text)
floatParser = Float <$> double

stringParser :: Parser (GML Text)
stringParser = do 
    let del = inClass "\""
    skip del
    s <- takeTill del
    skip del
    return (String s)
     
whitespace :: Parser ()
whitespace = skip isHorizontalSpace <|> endOfLine

