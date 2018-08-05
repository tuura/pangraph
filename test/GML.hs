{-# LANGUAGE OverloadedStrings #-}
module GML where

import Test.HUnit

import Pangraph
import Pangraph.GML.Ast
import Pangraph.GML.Parser

gmlTests :: [Test]
gmlTests = [parseTest1]

parseTest1 :: Test
parseTest1 = let
    file = "graph [node [id 1] node [id 2] edge [source 1 target 2]]"
    graph = Right (Object [("graph", Object [("node", Object [("id", Integer 1)]), 
                ("node", Object [("id", Integer 2)]),
                ("edge", Object [("source", Integer 1),
                    ("target", Integer 2)])])])
    in TestCase $ assertEqual "GML parseTest1"  graph (parseText file)
