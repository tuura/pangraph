{-# LANGUAGE OverloadedStrings #-}

module GraphML (
graphmlTests
) where

import Test.HUnit

import Pangraph
import Pangraph.GraphML.Parser
import Pangraph.GraphML.Writer
import Pangraph.Examples.SampleGraph

graphmlTests :: [Test]
graphmlTests = [case1, case2]

case1 :: Test
case1 =
  let
    file :: Either [MalformedEdge] Pangraph
    file = parse "<?xml version=\"1.0\" encoding=\"UTF-8\"?> \
            \<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\"\
            \    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\
            \    xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns\
            \     http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd\">\
            \  <graph id=\"G\" edgedefault=\"undirected\">\
            \    <node id=\"n0\"/>\
            \    <node id=\"n1\"/>\
            \    <node id=\"n2\"/>\
            \    <edge id=\"e1\" source=\"n0\" target=\"n2\"/>\
            \    </graph>\
            \</graphml>"
  in TestCase $ assertEqual "GraphML Parse case 1" (Right smallGraph) file

case2 :: Test
case2 = TestCase $ assertEqual "GraphML Write case 1" (Right smallGraph) (parse . write $ smallGraph)
