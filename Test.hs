{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Maybe
import Control.Applicative ((<$>))

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString                  as BS

import Pangraph
import qualified Pangraph.GraphML.Parser          as GraphML
import qualified Pangraph.VHDL.EnvironmentWriter  as VHDL
import qualified Pangraph.VHDL.GraphWriter        as VHDL

main :: IO ()
main = do
  putStrLn "\n------Testing begins------"
  putStrLn "Show Instance:"
  testShowInstance
  putStrLn "GraphML:"
  testGraphML
  putStrLn "VHDL:"
  testVHDL
  putStrLn "\n------All Tests Passed------"

testShowInstance :: IO ()
testShowInstance = do
  literal <- (head . lines) <$> readFile "test/show-string.txt"
  let  sampleVertices = [makeVertex "0" [("id","0")]
                       ,makeVertex "1" [ ("id","1")]]
       graph = fromMaybe
                 (error "Sample graph failed to build") $
                 makePangraph
                   sampleVertices [
                   makeEdge
                     [("source","0"), ("target","1")]
                     (head sampleVertices, sampleVertices !! 1)
                   ]
  if literal == show (graph :: Pangraph)
    then putStrLn "-Instance passed"
    else error
      $ "!Show instance failed test: \""
      ++ literal
      ++ "\"\nSample(above) != Graph(below)\n\""
      ++ show graph
        ++ "\""

testGraphML :: IO ()
testGraphML = do
  file <- BS.readFile "examples/graphs/small.graphml"
  let  sampleVertices = [
                makeVertex "n0" [ ("id","n0")],
                makeVertex "n1" [ ("id","n1")],
                makeVertex "n2" [ ("id","n2")]]
       graph = fromMaybe (error "Sample graph failed to build") $
                     makePangraph sampleVertices
                       [makeEdge
                         [("source","n0"),("target","n2")]
                         (head sampleVertices, sampleVertices !! 2)]
  if graph == GraphML.unsafeParse file
    then putStrLn "-Parse Passed"
    else error $ "!Test failed\n"
      ++ show graph
      ++ "\n!=\n"
      ++ show (GraphML.unsafeParse file)

testVHDL :: IO ()
testVHDL = do
  files <- mapM BS.readFile
    ["examples/graphs/n1/n1.graphml",
    "examples/graphs/n2/n2.graphml"]
  vhdlEnvironment <- mapM readFile
    ["examples/graphs/n1/n1-sim-environment.vhdl",
    "examples/graphs/n2/n2-sim-environment.vhdl"]
  vhdlGraph <- mapM readFile
    ["examples/graphs/n1/n1-graph.vhdl",
    "examples/graphs/n2/n2-graph.vhdl"]
  let test1 = zip files vhdlEnvironment
  let test2 = zip files vhdlGraph
  putStrLn $ concatMap (`applyTest` VHDL.writeEnvironmentVhdl) test1
  putStrLn $ concatMap (`applyTest` VHDL.writeGraphVhdl) test2
  where
    -- args: A graphML file, the string which should result, the function which maps the file to result
    applyTest :: (BS.ByteString, String) -> (Pangraph -> String) -> String
    applyTest (raw, sample) f =
      if f (GraphML.unsafeParse raw) == sample
        then "-VHDL passed\n"
        else error $ "!VHDL failed test : "
                   ++ show sample
                   ++ "\n!=\n"
                   ++ show (GraphML.unsafeParse raw)
