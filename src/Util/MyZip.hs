module Util.MyZip
( getFile
) where

import System.IO
import Codec.Archive.Zip
import System.Directory
import Path ((</>))
import Path
import Path.IO

getFile::FilePath-> FilePath -> IO(String)
getFile =undefined
-- getFile zipPath entryName=do
--   let myTempPath = getTempDir </> tempDir
--   withArchive zipPath' (unpackInto myTempPath)
--   file <- readFile $ toFilePath (myTempPath </> entryName')
--   removeDirRecur myTempPath
--   return file
--   where
--     t = "\\pangraph"
--     tempDir= parseRelDir t
--     zipPath' = parseRelFile zipPath
--     entryName' = parseRelFile entryName
