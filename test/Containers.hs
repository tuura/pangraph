module Containers
    ( containersTests
    ) where

import Test.HUnit
import Pangraph.Examples.SampleGraph(smallGraph)
import Pangraph.Containers(convert)

containersTests :: [Test]
containersTests = [case1]

case1 :: Test
case1 = TestCase $ assertEqual "Containers Convert case 1" ("array (0,2) [(0,[2]),(1,[]),(2,[])]") $ (show . (\(a,_,_) -> a) . convert) smallGraph
