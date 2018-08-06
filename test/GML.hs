{-# LANGUAGE OverloadedStrings #-}
module GML where

import Test.HUnit

import Pangraph
import Pangraph.GML.Ast
import Pangraph.GML.Parser

gmlTests :: [Test]
gmlTests = [parseTest1, pangraphConversion, testComments]

parseTest1 :: Test
parseTest1 = let
    file = "graph [node [id 1] node [id 2] edge [source 1 target 2]]"
    graph = Just (Object [("graph", Object [("node", Object [("id", Integer 1)]), 
                ("node", Object [("id", Integer 2)]),
                ("edge", Object [("source", Integer 1),
                    ("target", Integer 2)])])])
    in TestCase $ assertEqual "GML parseTest1" graph (parseGml file)

pangraphConversion :: Test
pangraphConversion = let
    file = "graph [node [id 1] node [id 2] edge [source 1 target 2]]"
    vertices = [makeVertex "1" [("id", "1")], makeVertex "2" [("id", "2")]]
    edges = [makeEdge [("source", "1"), ("target", "2")] (vertices !! 0, vertices !! 1)]
    pangraph = makePangraph vertices edges
    in TestCase $ assertEqual "GML parseTest2" pangraph (parse file)
    
testComments :: Test
testComments = let
    file = "#test"
    graph = Just (Object [])
    in TestCase $ assertEqual "GML testComments" graph (parseGml file)
