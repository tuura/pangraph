module Util.MyXML
( parseFile
)where

import Text.Parsec
import Util.Types

-- Parses a XML format into a rose tree structure, it must be called using parsec's parse.
-- The resuting structure should be filtered to allow for a ShortGraph to be produced.
-- Of similar vein to GmlP.hs
-- Except the use to tagParse looking for multiple parsers.

parseFile::Parsec String () Root
parseFile=do
  _ <- string "<?xml"
  as <- many $ try attParse
  _ <- string "?>"
  spaces
  n <- tagParse
  return $ Root as n


tagParse::Parsec String () Tag
tagParse=choice [nodeTagParse, strTagParse]


strTagParse::Parsec String () Tag
strTagParse=do
  xs <- many1 $ (try alphaNum) <|> oneOf " \n" -- anyChar $ try $ char '<' <|> eof
  return $ StrTag xs

nodeTagParse::Parsec String () Tag
nodeTagParse=do
  _ <- char '<'
  name <- many1 $ try alphaNum
  as <- many $ attParse
  c <- anyChar
  ns <- tagHelper c
  return $ NodeTag name as ns

tagHelper::Char -> Parsec String () [Tag]
tagHelper c
  |c == '/' = closeTag
  |c == '>' = childrenParse
  |otherwise = eFunc

closeTag:: Parsec String () [Tag]
closeTag=do
  char '>'
  return []

childrenParse::Parsec String () [Tag]
childrenParse=do
  ns <- many $ try tagParse
  _ <- closingTag
  return ns

eFunc::Parsec String () [Tag]
eFunc = do
  str <- manyTill anyChar $ try eof
  -- let ns = []
  return $ [StrTag str]

closingTag:: Parsec String () ()
closingTag=do
  _ <- string "</"
  _ <- manyTill alphaNum $ try $ char '>'
  return ()

attParse::Parsec String () Att
attParse=do
  many1 $ try (oneOf " \n")
  x <- manyTill anyChar $ try (string "=\"")
  y <- manyTill anyChar $ try (char '"')
  return $ Att (x ,y)
