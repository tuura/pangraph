module FGL (
    fglTests
    ) where

import Test.HUnit

import Pangraph.Examples.SampleGraph(smallGraph)
import Pangraph.FGL(convert)

fglTests :: [Test]
fglTests = [case1]

case1 :: Test
case1 = TestCase $ assertEqual "FGL Convert Case 1" "([(0,\"n0\"),(1,\"n1\"),(2,\"n2\")],[(0,2,0)])" (show . convert $ smallGraph)