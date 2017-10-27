module Pangraph.Examples.Writing where

import Pangraph.GraphML.Writer(write)
import Pangraph.Examples.SampleGraph(smallGraph)

main :: IO ()
main =
  print $ write smallGraph
