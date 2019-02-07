{-# LANGUAGE OverloadedStrings #-}

module Pajek where

import Test.HUnit

import Pangraph
import Pangraph.Pajek.Ast
import Pangraph.Pajek.Parser
import Pangraph.Pajek.Writer

pajekTests :: [Test]
pajekTests = [parseTest1, parseTest2, parseTest3, parseTest4, parseTest5,
  parseTest6, parseTest7, parseTest8, parseTest9, writeTest1]

parseTest1 :: Test
parseTest1 = let
    file = "*vertices 0\n*edges"
    graph = Just (Graph Nothing [] [])
    in TestCase $ assertEqual "Pajek parse test 1" graph (parsePajek file)

parseTest2 :: Test
parseTest2 = let
    file = "*Network \"Empty\"\n*Vertices 0\n*Edges"
    graph = Just (Graph (Just "Empty") [] [])
    in TestCase $ assertEqual "Pajek parse test 2" graph (parsePajek file)

parseTest3 :: Test
parseTest3 = let
    file = "*Network \"Test\"\n*Vertices 2\n0 \"Node 0\"\n1 \"Node 1\"\n*Edges"
    graph = Just (Graph (Just "Test") [(0,Just "Node 0"),(1,Just "Node 1")] [])
    in TestCase $ assertEqual "Pajek parse test 3" graph (parsePajek file)

parseTest4 :: Test
parseTest4 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Edges\n1 2\n"
    graph = Just (Graph (Just "Test") [(1, Just "Node 1"),(2,Just "Node 2")] [Unweighted True 1 2])
    in TestCase $ assertEqual "Pajek parse test 4" graph (parsePajek file)

parseTest5 :: Test
parseTest5 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Arcs\n1 2\n"
    graph = Just (Graph (Just "Test") [(1, Just "Node 1"),(2,Just "Node 2")] [Unweighted False 1 2])
    in TestCase $ assertEqual "Pajek parse test 5" graph (parsePajek file)

parseTest6 :: Test
parseTest6 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Arcslist\n1 2\n"
    graph = Just (Graph (Just "Test") [(1, Just "Node 1"),(2,Just "Node 2")] [Unweighted False 1 2])
    in TestCase $ assertEqual "Pajek parse test 6" graph (parsePajek file)

parseTest7 :: Test
parseTest7 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Edgeslist\n1 2\n"
    graph = Just (Graph (Just "Test") [(1, Just "Node 1"),(2,Just "Node 2")] [Unweighted True 1 2])
    in TestCase $ assertEqual "Pajek parse test 7" graph (parsePajek file)

graph1 :: Pangraph
graph1 = let
    vertices' = [makeVertex "1" [("label", "Node 1")], makeVertex "2" [("label", "Node 2")]]
    [v1,v2] = map vertexID vertices'
    edges' = [makeEdge (v1, v2) []]
    Just graph = makePangraph vertices' edges'
    in graph

parseTest8 :: Test
parseTest8 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Edgeslist\n1 2\n"
    in TestCase $ assertEqual "Pajek parse test 8" (Just graph1) (parse file)

graph2 :: Pangraph
graph2 = let
    vertices' = [makeVertex "1" [("label", "Node 1")],
      makeVertex "2" [("label", "Node 2")], makeVertex "3" [("label","3")]]
    [v1, v2, v3] = map vertexID vertices'
    edges' = [makeEdge (v1, v2) [], makeEdge (v2, v3) []]
    Just graph = makePangraph vertices' edges'
    in graph

parseTest9 :: Test
parseTest9 = let
    file = "*Network \"Test\"\n*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n3 3\n*Arcs\n1 2\n2 3"
    in TestCase $ assertEqual "Pajek parse test 9" (Just graph2) (parse file)

writeTest1 :: Test
writeTest1 = let
    output = "*Vertices 2\n1 \"Node 1\"\n2 \"Node 2\"\n*Arcs 1\n1 2\n"
    in TestCase $ assertEqual "Pajek write test 1" output (write graph1)
