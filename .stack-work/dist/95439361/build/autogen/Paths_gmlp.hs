module Paths_gmlp (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\testuserignore\\github\\pangraph\\.stack-work\\install\\876f4a9f\\bin"
libdir     = "C:\\Users\\testuserignore\\github\\pangraph\\.stack-work\\install\\876f4a9f\\lib\\i386-windows-ghc-7.10.3\\gmlp-0.1.0.0-3M29I1e6N7FDSykZk1FK9j"
datadir    = "C:\\Users\\testuserignore\\github\\pangraph\\.stack-work\\install\\876f4a9f\\share\\i386-windows-ghc-7.10.3\\gmlp-0.1.0.0"
libexecdir = "C:\\Users\\testuserignore\\github\\pangraph\\.stack-work\\install\\876f4a9f\\libexec"
sysconfdir = "C:\\Users\\testuserignore\\github\\pangraph\\.stack-work\\install\\876f4a9f\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gmlp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gmlp_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gmlp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gmlp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gmlp_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
