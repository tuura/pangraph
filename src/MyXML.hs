module MyXML
( fileParse
  )where

import Text.Parsec
-- import Text.Parsec (<|>)
-- import Control.Applicative hiding (<|>)

data Att = Att (String, String) deriving (Show)
data Node = NodeTag String [Att] [Node]
          | NodeStr String deriving (Show)
data Root = Root [Att] Node deriving (Show)

fileParse::Parsec String () Root
fileParse=do
  _ <- string "<?xml"
  as <- many $ try attParse
  _ <- string "?>"
  spaces
  n <- nodeParse
  return $ Root as n

nodeParse::Parsec String () Node
nodeParse=choice [tagNodeParse, strNodeParse]

strNodeParse::Parsec String () Node
strNodeParse=do
  xs <- many1 $ (try alphaNum) <|> oneOf " \n" -- anyChar $ try $ char '<' <|> eof
  -- ns <- many $ try nodeParse
  return $ NodeStr xs

tagNodeParse::Parsec String () Node
tagNodeParse=do
  _ <- char '<'
  name <- many1 $ try alphaNum
  as <- many $ attParse
  c <- anyChar
  ns <- nodeHelper c
  return $ NodeTag name as ns

nodeHelper::Char -> Parsec String () [Node]
nodeHelper c
  |c == '/' = closeTag
  |c == '>' = childrenParse
  |otherwise = eFunc

closeTag:: Parsec String () [Node]
closeTag=do
  char '>'
  return []

childrenParse::Parsec String () [Node]
childrenParse=do
  ns <- many $ try nodeParse
  _ <- closingTag
  return ns

eFunc::Parsec String () [Node]
eFunc = do
  str <- manyTill anyChar $ try eof
  -- let ns = []
  return $ [NodeStr str]

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
