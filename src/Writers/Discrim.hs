module Writers.Discrim where

import Writers.GmlW

import Util.Types
import Data.List
import qualified Data.List.Split as S
import qualified Writers.GmlW as G

writeGraph::FilePath -> ShortFile -> IO ()
writeGraph path' graph=writeIt file
  where
    writeIt = disc file
    file = MyFile dir name graph
    dir =(concat $ intersperse "\\" $ init $ S.splitOn "\\" path) ++ "\\"
    name = reverse.takeWhile (/='\\') $ reverse path
    path = santizeDir path'

-- fileParser::FilePath -> String
-- fileParser str=reverse.takeWhile (/='\\') $ reverse str
--
-- dirParser::FilePath -> String
-- dirParser str =

disc::MyFile -> (MyFile -> IO())
disc (MyFile _ name _)
  |fileType == "work" = error $ name ++ ", is unimplemented"
  |fileType == "graphml" = G.writeGraph
  |otherwise = error $ "Unrecognized file type: " ++ show name
  where
    fileType = reverse.takeWhile (/='.') $ reverse name
santizeDir::FilePath -> FilePath
santizeDir [] = []
santizeDir path
  |head path == '/' = ['\\'] ++ theRest
  |otherwise = [head path] ++ theRest
  where
    theRest =santizeDir $ tail path
