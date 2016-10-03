module Parsers.GmlP
(   parseFile
,   shortenFile
)where

import Text.Parsec
import Util.Types
import qualified Parsers.Shorten as S

-- Bare in mind this code has been written specifically for the graphml format.
-- Provides the same interface as other graph types but it is self contained.
-- Shorten.hs is just an extension of this source file.

-- Applies the shortening to a Rose Tree
shortenFile::Root -> ShortFile
shortenFile r=S.shortenFile r

-- Applies the parsec functions to the file, handling parse errors appropriatly.
parseFile::String -> FilePath -> ShortFile
parseFile file path=either errFunc shortenFile xml
  where
    errFunc _ = error $ show xml ++ show file
    xml = parse parseRoot file path

-- Parses an attribute: " id=\"098\""
attributeParse::Parsec String () Att
attributeParse=do
  many1 $ try $ choice [string " ", myEOL]
  -- _ <- many $ choice [string " ", myEOL]

  x <- manyTill anyChar $ try (string "=\"")
  y <- manyTill anyChar $ try (char '"')
  return $ Att (x, y)

-- Handles parsing of a tag, as this module is specific to graphml this function watches for keywords and has awful branching.
-- It is also mutally recursive with "parseChildren"
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

-- Searches for many children before a tag closes.
-- Mutally recursive with "tagParse"
parseChildren::Char -> String -> Parsec String () [Tag]
parseChildren x ns=do
  if x == '/'
  then do
    _ <- char '>'
    return []
  else do
    bs <- try (many tagParse)
    _ <- many $ choice [string " ", myEOL]
    _ <- string $ "</" ++ ns ++ ">"
    return bs

-- Entry point to parser, gets non closing Root before returning the graph.
parseRoot:: Parsec String () Root
parseRoot=do
  _ <- manyTill anyChar $ try (string "<?")
  _ <- string "xml"
  as <- many $ try attributeParse
  _ <- string "?>"
  ts <- try tagParse
  return $ Root as ts

myEOL::Parsec String () String
myEOL=try $ choice [string "\n", string "\r\n", string "\n"]
