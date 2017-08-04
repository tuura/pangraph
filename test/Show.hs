{-# LANGUAGE OverloadedStrings #-}

module Show (
showTests
) where

import Data.Maybe
import Test.HUnit
import Pangraph


showTests :: [Test]
showTests = [case1]

case1 :: Test
case1 =
  let
    literal = "makePangraph [makeVertex \"0\" \
    \[(\"id\",\"0\")],makeVertex \"1\" \
    \[(\"id\",\"1\")]] [makeEdge \
    \[(\"source\",\"0\"),(\"target\",\"1\")] \
    \(makeVertex \"0\" \
    \[(\"id\",\"0\")],makeVertex \"1\" [(\"id\",\"1\")])]"
    sampleVertices = [makeVertex "0" [("id","0")]
                     ,makeVertex "1" [ ("id","1")]]
    graph = show $ fromMaybe
             (error "Sample graph failed to build") $
             makePangraph
               sampleVertices [
               makeEdge
                 [("source","0"), ("target","1")]
                 (head sampleVertices, sampleVertices !! 1)
             ]
  in TestCase $ assertEqual "Show instance case 1" literal (graph :: String)
