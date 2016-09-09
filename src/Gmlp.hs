module GmlP
(   parseFile
)where

import Text.Parsec
import Types

attributeParse::Parsec String () Att
attributeParse=do
  many1 $ try (oneOf " \n")
  x <- manyTill anyChar $ try (string "=\"")
  y <- manyTill anyChar $ try (char '"')
  return $ Att (x, y)

tagParse::Parsec String () Tag
tagParse=try $ do
  _ <- manyTill anyChar $ try (char '<')
  ns <- many1 $ try letter
  if ns == "default"
  then do
    char '>'
    ts <- manyTill anyChar $ try (string "</default>")
    let as= [(Att ("defVal", ts))]
    return $ NodeTag ns as []
  else if ns == "data"
  then do
    as <- attributeParse
    char '>'
    ts <- manyTill anyChar $ (string "</data>")
    let bs = [as, (Att ("val", ts))]
    return $ NodeTag ns bs []
  else do
    as <- many $ try attributeParse
    nxt <- anyChar
    ts <- parseChildren nxt ns
    return $ NodeTag ns as ts

parseChildren::Char -> String -> Parsec String () [Tag]
parseChildren x ns=do
  if x == '/'
  then do
    _ <- char '>'
    return []
  else do
    bs <- try (many tagParse)
    _ <- many $ try (oneOf " \n")
    _ <- string $ "</" ++ ns ++ ">"
    return bs

parseFile:: Parsec String () Root
parseFile=do
  _ <- manyTill anyChar $ try (string "<?")
  _ <- string "xml"
  as <- many $ try attributeParse
  _ <- string "?>"
  ts <- try tagParse
  return $ Root as ts
