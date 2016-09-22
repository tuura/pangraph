module Writers.Discrim
( writeGraph
) where

import Writers.GmlW

import Util.Types
import Data.List
import qualified Data.List.Split as S
import qualified Writers.GmlW as G

-- decides which writer to use. Manipulates the path to check it exists.
writeGraph::FilePath -> ShortFile -> IO ()
writeGraph path' graph=writeIt file
  where
    writeIt = disc file
    file = MyFile dir name graph
    dir =(concat $ intersperse "/" $ init $ S.splitOn "\\" path)
    name = "/" ++ (reverse.takeWhile (/='\\') $ reverse path)
    path = santizeDir path'

-- Decides the parser to use based on file type.
disc::MyFile -> (MyFile -> IO())
disc (MyFile _ name _)
  |fileType == "work" = error $ name ++ ", is unimplemented"
  |fileType == "graphml" = G.writeGraph'
  |otherwise = error $ "Unrecognized file type: " ++ show name
  where
    fileType = reverse.takeWhile (/='.') $ reverse name

-- Ensures the path is normative of the form:
-- C:/a/b/c.filetype
santizeDir::FilePath -> FilePath
santizeDir [] = []
santizeDir path
  |head path == '/' = ['\\'] ++ theRest
  |otherwise = [head path] ++ theRest
  where
    theRest =santizeDir $ tail path
