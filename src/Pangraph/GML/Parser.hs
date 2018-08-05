{-# LANGUAGE OverloadedStrings #-}
module Pangraph.GML.Parser where

import Data.Attoparsec.Text
import Data.Text (Text, cons, pack)
import Data.Text.Encoding (decodeUtf8)
import Control.Applicative ((<|>), (<*))
import Data.ByteString (ByteString)
import Prelude hiding (takeWhile)

import Pangraph.GML.Ast

parse :: ByteString -> Either String (GML Text)
parse = parseText . decodeUtf8

parseText :: Text -> Either String (GML Text)
parseText = parseOnly (gmlParser <* endOfInput)

parseString :: String -> Either String (GML Text)
parseString str = parseText (pack str)

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
innerListParser = do
    entries <- many' listEntryParser
    return (Object entries)

listEntryParser :: Parser (Text, GML Text)
listEntryParser = do
    skipSpace
    name <- key
    skipMany1 (whitespace)
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
integerParser = do
    i <- signed decimal
    return (Integer i)

floatParser :: Parser (GML Text)
floatParser = do
    d <- double
    return (Float d)

stringParser :: Parser (GML Text)
stringParser = do 
    let del = inClass "\""
    skip del
    s <- takeTill del
    skip del
    return (String s)
     
whitespace :: Parser ()
whitespace = skip isHorizontalSpace <|> endOfLine

