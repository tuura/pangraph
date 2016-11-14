module VHDL where

import Pangraph
import qualified Pangraph.VHDL.Writer as V

main::IO()
main=do
  let vhdlString = V.writeVHDL graph
  putStrLn vhdlString
  where
    graph = ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
