module Writing where

import System.IO
import Pangraph
import qualified Pangraph.GraphML.Writer as G

main::IO()
main=do
  filePath <- getLine
  G.writeGraph filePath graph
  where
    graph = ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
