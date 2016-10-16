module Pangraph.Util.MyZip
( getFile
) where

-- import System.IO
-- import Codec.Archive.Zip
-- import System.Directory
-- import Path ((</>))
-- import Path
-- import Path.IO

-- Current issue is with getting Path types to match.
-- The function is trying to extract a given entry from a given archive.
-- It does this by unpacking everything into a temp folder, looking for the entry and reading it.
-- Deletes the temp folder and returns.

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
