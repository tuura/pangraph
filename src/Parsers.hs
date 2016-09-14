module Parsers
( parseFile
-- , pathParser
-- , parserMultiplexer
)where

import Data.List
import qualified GmlP as G
import qualified WorkP as W
import Types

parseFile:: String -> String -> [String]-> ShortFile
parseFile file path args =parserToUse file path
  where
    fileType = pathParser path
    parserToUse = parserMultiplexer fileType

parserMultiplexer::String -> (String -> String -> ShortFile)
parserMultiplexer fileType
  |fileType =="xml" = W.parseFile
  |fileType == "graphml" = G.parseFile
  | otherwise = error $ "unsupported extension: ." ++ fileType
  -- |otherwise = failParser

pathParser::String -> String
pathParser str=reverse.takeWhile (/='.') $ reverse str

failParser::String -> String -> ShortFile
failParser _ _ = ShortFile[]
