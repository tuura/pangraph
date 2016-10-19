module Pangraph.Util.FileHandler
( writeHandler
, normalizePath
)where

import Pangraph.Util.Types
import System.Directory
import Data.List
import qualified Data.List.Split as S

type MyDir = String
type MyFile = String

writeHandler::FilePath -> String -> IO ()
writeHandler path text=do
  if file == (santizeDir path)
    then actualFileWrite text [] path
    else
      do
        -- putStrLn $ dir ++ " : " ++ file
        actualFileWrite text (normalizePath $ santizeDir dir) file
  where
    file = last $ S.splitOn "\\" $ santizeDir path
    dir = concat $ intersperse "\\" $  init $ S.splitOn "\\" $ santizeDir path

actualFileWrite:: String -> MyDir -> MyFile -> IO()
actualFileWrite text [] file= writeFile file text
actualFileWrite text dir' file=do
  putStrLn $ "dir var on entry : " ++ dir
  bl <- doesDirectoryExist dir
  if not bl
    then error $ "Directory not found: " ++ dir
    else Prelude.writeFile fullPath text
  where
    fullPath = (dir ++ "/" ++ file)
    dir = normalizePath dir'

normalizePath::FilePath -> FilePath
normalizePath y= if head x `elem` "\\" then tail x else x
  where x =  santizeDir y
-- Ensures the path is normative of the form:
-- C:\a\b\c.filetype
santizeDir::FilePath -> FilePath
santizeDir [] = []
santizeDir path
  |head path == '/' = ['\\'] ++ theRest
  |otherwise = [head path] ++ theRest
  where
    theRest =santizeDir $ tail path
