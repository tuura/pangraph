{-# LANGUAGE OverloadedStrings #-}

module GraphML (
graphmlTests
) where

import Test.HUnit

import Pangraph
import Pangraph.GraphML.Parser


graphmlTests :: [Test]
graphmlTests =  [case1]

case1 :: Test
case1 =
  let
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
    sampleVertices = [
                      makeVertex "n0" [ ("id","n0")],
                      makeVertex "n1" [ ("id","n1")],
                      makeVertex "n2" [ ("id","n2")]]
    graph = makePangraph sampleVertices
      [makeEdge
        [("source","n0"),("target","n2")]
        (head sampleVertices, sampleVertices !! 2)]
  in TestCase $ assertEqual "GraphML Parse case 1" (graph :: Maybe Pangraph) file
