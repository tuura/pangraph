module Pangraph.Examples.ToContainersGraph where

import Pangraph.Containers(convert)
import Pangraph.Examples.SampleGraph(smallGraph)

main :: IO ()
main =
  -- Transform to Containers Data.Graph and print.
  print $ ((\(a,_,_) -> a) . convert) smallGraph
