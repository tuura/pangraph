module Pangraph.Writer
( writeGraph
, writeGraphVhdl
, writeEnvironmentVhdl
) where

import Data.List
import Pangraph.Util.Types
import qualified Pangraph.GraphML.Writer as G
import Pangraph.VHDL.GraphWriter
import Pangraph.VHDL.EnvironmentWriter

-- decides which writer to use. Manipulates the path to check it exists.
writeGraph::FilePath -> ShortFile -> IO ()
writeGraph path graph=(disc path)  path graph

-- Decides the parser to use based on file type.
disc::FilePath -> (FilePath -> ShortFile -> IO())
disc path
  |fileType == "work" = error $ "Workcraft writing is unimplemented"
  |fileType == "graphml" = G.writeGraph
  |otherwise = error $ "Unrecognized file type"
  where
    fileType = reverse.takeWhile (/='.') $ reverse path
