module Reading where

import System.IO
import Pangraph
import qualified Pangraph.GraphML.Parser as G

main::IO()
main=do
  fileName <- getLine
  file <- readFile fileName
  let graph = G.parseAsString file
  putStr $ show graph
