module Parsers.Discrim
( parseGraph
, readGraph
, ParseInstance(..)
, ShortGraph(..)
, ShortFile(..)
, Node(..)
, Edge(..)
, Att(..)
)where

import Data.List
import qualified Parsers.GmlP as G
import qualified Parsers.WorkP as W
import qualified Util.MyZip as Z
import Util.Types

type File = String
type Args = [String]
data ParseInstance = ParseInstance FilePath File (String -> String -> ShortFile) Args

readGraph::FilePath -> Args ->IO (ParseInstance)
readGraph fPath as=do
  file <- myReadFile fPath
  return $ ParseInstance fPath file parser as
  where
    parser= parserMultiplexer $ pathParser fPath

parseGraph::ParseInstance-> ShortFile
parseGraph (ParseInstance file path parserToUse _) =parserToUse file path

parserMultiplexer::String -> (String -> String -> ShortFile)
parserMultiplexer fileType
  |fileType =="xml" = W.parseFile
  |fileType == "graphml" = G.parseFile
  |otherwise = error $ "unsupported extension: ." ++ fileType

pathParser::FilePath -> String
pathParser str=reverse.takeWhile (/='.') $ reverse str

myReadFile::FilePath -> IO (String)
myReadFile path
  |fileType == "graphml" = readFile path
  |fileType == "xml" = readFile path
  -- |fileType == "work" = Z.getFile path "model.xml"
  |otherwise = error $ "unsupported extension: ." ++ fileType
  where
    fileType = pathParser path
