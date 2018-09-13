{-# LANGUAGE OverloadedStrings #-}

module Gml where

import Test.HUnit

import Data.Maybe(fromJust)

import Pangraph
import Pangraph.Gml.Ast
import Pangraph.Gml.Parser
import Pangraph.Gml.Writer

gmlTests :: [Test]
gmlTests = [testGmlParse, pangraphConversion, testComments, testGmlWrite,
    testPangraphWrite, testHtmlEntitiesDecoding, testHtmlEntitiesEncoding]

testGmlParse :: Test
testGmlParse = let
    file = "graph [node [id 1 label \"Hello\"] node [id 2] edge [source 1 target 2]]"
    graph = Just (Object [("graph", Object [
                ("node", Object [("id", Integer 1), ("label", String "Hello")]), 
                ("node", Object [("id", Integer 2)]),
                ("edge", Object [("source", Integer 1),
                    ("target", Integer 2)])])])
    in TestCase $ assertEqual "GML parseTest1" graph (parseGml file)

pangraphConversion :: Test
pangraphConversion = let
    file = "graph [node [id 1] node [id 2] edge [source 1 target 2]]"
    vertices = [makeVertex "1" [("id", "1")], makeVertex "2" [("id", "2")]]
    [v1,v2] = map vertexID vertices
    edges = [makeEdge (v1, v2) [("source", "1"), ("target", "2")] ]
    pangraph = makePangraph vertices edges
    in TestCase $ assertEqual "GML pangraphConversion" pangraph (parse file)
    
testComments :: Test
testComments = let
    file = "#test"
    graph = Just (Object [])
    in TestCase $ assertEqual "GML testComments" graph (parseGml file)

testGmlWrite :: Test
testGmlWrite = let
    graph = (Object [("graph", Object [("node", Object [("id", Integer 1)]), 
                ("node", Object [("id", Integer 2)]),
                ("edge", Object [("source", Integer 1),
                    ("target", Integer 2)])])])
    file = Just "graph [ node [ id 1] node [ id 2] edge [ source 1 target 2]]"
    in TestCase $ assertEqual "GML testWriteGML" file (writeGml graph)

testPangraphWrite :: Test
testPangraphWrite = let
    file = "graph [ node [ id 1] node [ id 2] edge [ source 1 target 2]]"
    in TestCase $ assertEqual "GML parseTest2" file (write gmlPangraphWrite)

testHtmlEntitiesDecoding :: Test
testHtmlEntitiesDecoding = let
    file = "graph [node [id 1 label \"&quot;Hello&quot;\" ] node [id 2] edge [source 1 target 2]]"
    in TestCase $ assertEqual "GML testHtmlEntitiesDecoding" (Just gmlPangraph) (parse file)

testHtmlEntitiesEncoding :: Test
testHtmlEntitiesEncoding = let
    file = "graph [ node [ id 1 label \"&quot;Hello&quot;\"] node [ id 2] edge [ source 1 target 2]]"
    in TestCase $ assertEqual "GML testHtmlEntitiesEncoding" file (write gmlPangraph) 

gmlPangraph :: Pangraph
gmlPangraph = let
    vertices = [makeVertex "1" [("id", "1"), ("label", "\"Hello\"")], makeVertex "2" [("id", "2")]]
    [v1,v2] = map vertexID vertices
    edges = [makeEdge (v1, v2) [("source", "1"), ("target", "2")]]
    in fromJust $ makePangraph vertices edges

gmlPangraphWrite :: Pangraph
gmlPangraphWrite = let
    vertices = [makeVertex "1" [("id", "1")], makeVertex "2" [("id", "2")]]
    [v1,v2] = map vertexID vertices
    edges = [makeEdge (v1, v2) [("source", "1"), ("target", "2")]]
    
    in fromJust $ makePangraph vertices edges