module Pangraph.Graph (
Graph
  ) where

import qualified Pangraph as P

class Graph a where
  parseGraph::a -> [P.Pangraph]
  -- writeGraph::Pangraph -> a
