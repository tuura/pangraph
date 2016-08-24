module Gmlp
(
    Attribute(..)
,   Tag (..)
,   File(..)
,   parseFile
)where

import Text.Parsec


data Attribute = Attribute (String, String) deriving (Show)
data Tag = Tag String [Attribute] (Maybe [Tag]) deriving (Show)
data File= File String [Attribute] [Tag] deriving (Show)

attributeParse:: Parsec String () Attribute
attributeParse=do
  many1 $ try (oneOf " \n")
  x <- manyTill anyChar $ try (string "=\"")
  y <- manyTill anyChar $ try (char '"')
  return $ Attribute (x, y)

tagParse::Parsec String () Tag
tagParse=try $ do
  _ <- manyTill anyChar $ try (char '<')
  ns <- many1 $ try letter
  if ns == "default"
  then do
    char '>'
    ts <- manyTill anyChar $ try (string "</default>")
    let bs= [(Attribute ("defVal", ts))]
    return $ Tag ns bs Nothing
  else if ns == "data"
  then do
    as <- attributeParse
    char '>'
    ts <- manyTill anyChar $ (string "</data>")
    let bs = [as, (Attribute ("val", ts))]
    return $ Tag ns bs Nothing
  else do
    as <- many $ try attributeParse
    nxt <- anyChar
    ts <- parseChildren nxt ns
    return $ Tag ns as ts

parseChildren::Char -> String -> Parsec String () (Maybe [Tag])
parseChildren x ns=do
  if x == '/'
  then do
    _ <- char '>'
    return Nothing
  else do
    bs <- try (many tagParse)
    _ <- many $ try (oneOf " \n")
    _ <- string $ "</" ++ ns ++ ">"
    return $ Just bs

parseFile:: Parsec String () File
parseFile=do
  _ <- manyTill anyChar $ try (string "<?")
  ns <- string "xml"
  as <- many $ try attributeParse
  _ <- string "?>"
  ts <- many $ try tagParse
  return $ File ns as ts
