module Pangraph.Examples.Writing where

import Pangraph.GraphML.Writer(write)
import Pangraph.Examples.SampleGraph(smallGraph)

main :: IO ()
main =
  -- >>> :t write
  -- write :: Pangraph.Pangraph -> Data.ByteString.Internal.ByteString
  print $ write smallGraph
