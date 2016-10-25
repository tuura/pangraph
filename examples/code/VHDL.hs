module VHDL where

import System.IO
import Pangraph
-- import qualified Pangraph.GraphML.Writer as G
import qualified Pangraph.VHDL.Writer as V

main::IO()
main=do
  -- filePath <- getLine
  let vhdlString = V.writeVHDL graph
  putStrLn vhdlString
  where
    graph = ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
