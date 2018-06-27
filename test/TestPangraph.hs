module TestPangraph (
    pangraphTests
) where

import Test.HUnit
import Pangraph
import Pangraph.Examples.SampleGraph(smallGraph)

import Data.Maybe(mapMaybe)

pangraphTests :: [Test]
pangraphTests = [pangraphCases]

pangraphCases :: Test
pangraphCases = 
    let
        graph = (length . mapMaybe edgeID) (edgeList smallGraph)
        graphEdgeNo = (length . edgeList) smallGraph
    in TestCase $ assertEqual "Edges have \"Just Edge ID\" case 1" graphEdgeNo (graph :: Int)
