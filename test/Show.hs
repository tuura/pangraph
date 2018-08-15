{-# LANGUAGE OverloadedStrings #-}

module Show (
showTests
) where

import Test.HUnit
import Pangraph.Examples.SampleGraph

showTests :: [Test]
showTests = [case1]

case1 :: Test
case1 =
  let
    literal :: String
    literal = 
      "makePangraph [makeVertex \"n0\" [(\"id\",\"n0\")]\
      \,makeVertex \"n1\" [(\"id\",\"n1\")],\
      \makeVertex \"n2\" [(\"id\",\"n2\")]] \
      \[makeEdge (\"n0\",\"n2\") \
      \[(\"source\",\"n0\"),(\"target\",\"n2\")]]"
    in TestCase $ assertEqual "Show instance case 1" literal (show smallGraph)
