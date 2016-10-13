module Parsers.Parser
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
import qualified Parsers.GmlParser as G
import qualified Parsers.WorkParser as W
import qualified Util.MyZip as Z
import Util.Types

-- A parse instance is passed so that the IO may be seperate from the processing of the graph. While allowing the library to handle non plain text graph formats.
type File = String
type Args = [String]
data ParseInstance = ParseInstance FilePath File (String -> String -> ShortFile) Args

-- The API exported to read Graph formats. Returns the ParseInstance
readGraph::FilePath -> Args ->IO (ParseInstance)
readGraph fPath as=do
  file <- myReadFile fPath
  return $ ParseInstance fPath file parser as
  where
    parser= parserMultiplexer $ pathParser fPath

-- Applies the parser to the files contents.
parseGraph::ParseInstance-> ShortFile
parseGraph (ParseInstance file path parserToUse _) =parserToUse file path

-- From file extension gets a parseFile function to use
parserMultiplexer::String -> (String -> String -> ShortFile)
parserMultiplexer fileType
  |fileType =="xml" = W.parseFile
  |fileType == "graphml" = G.parseFile
  |otherwise = error $ "unsupported extension: ." ++ fileType

-- Gets a file extension from a path.
pathParser::FilePath -> String
pathParser str=reverse.takeWhile (/='.') $ reverse str

-- This decides whether to read as plain text or maybe extract form zip.
myReadFile::FilePath -> IO (String)
myReadFile path'
  |fileType == "graphml" = readFile path
  |fileType == "xml" = readFile path
  -- |fileType == "work" = Z.getFile path "model.xml"
  |otherwise = error $ "unsupported extension: ." ++ fileType
  where
    fileType = pathParser path
    path = if  head path' == '/' then tail path' else path'
