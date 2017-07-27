{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Maybe

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString                  as BS
import qualified Pangraph                         as P
import qualified Pangraph.GraphML.Parser          as GraphML_P
import qualified Pangraph.VHDL.EnvironmentWriter  as VHDL_E
import qualified Pangraph.VHDL.GraphWriter        as VHDL_G

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
  literal <-fmap (head . lines) $ readFile "test/show-string.txt"
  let graph = fromMaybe
                (error "Sample graph failed to build") $
                P.makePangraph
                  sampleVertices [
                  P.makeEdge
                    [("source","0"), ("target","1")]
                    (head sampleVertices, sampleVertices !! 1)
                  ]
      sampleVertices = [P.makeVertex "0" [("id","0")]
                       ,P.makeVertex "1" [ ("id","1")]]
  if literal == show (graph :: P.Pangraph)
    then putStrLn "-Instance passed"
    else error
      $ "!Show instance failed test: \""
      ++ literal
      ++ "\"\nSample(above) != Graph(below)\n\""
      ++ show graph
        ++ "\""

    -- Without escapes:
    -- makePangraph [makeVertex "0" [("id","0")],makeVertex "1" [("id","1")]] [makeEdge [("source","0"),("target","1")] (makeVertex "0" [("id","0")],makeVertex "1" [("id","1")])]

testGraphML :: IO ()
testGraphML = do
  file <- BS.readFile "examples/graphs/small.graphml"
  let graph  = fromMaybe (error "Sample graph failed to build") graph'
      graph' = P.makePangraph sampleVertices
                [P.makeEdge
                  [("source","n0"),("target","n2")]
                  (head sampleVertices, sampleVertices !! 2)]
      sampleVertices = [
               P.makeVertex "n0" [ ("id","n0")],
               P.makeVertex "n1" [ ("id","n1")],
               P.makeVertex "n2" [ ("id","n2")]]

  if graph == GraphML_P.unsafeParse file
    then putStrLn "-Parse Passed"
    else error $ "!Test failed\n"
      ++ show graph
      ++ "\n!=\n"
      ++ show (GraphML_P.unsafeParse file)

testVHDL :: IO ()
testVHDL = do
  files <- mapM BS.readFile ["examples/graphs/n1/n1.graphml",
    "examples/graphs/n2/n2.graphml"]
  vhdlEnvironment <- mapM readFile ["examples/graphs/n1/n1-sim-environment.vhdl",
    "examples/graphs/n2/n2-sim-environment.vhdl"]
  vhdlGraph <- mapM readFile ["examples/graphs/n1/n1-graph.vhdl",
    "examples/graphs/n2/n2-graph.vhdl"]
  let test1 = zip files vhdlEnvironment
  let test2 = zip files vhdlGraph
  putStrLn $ concatMap (`applyTest` VHDL_E.writeEnvironmentVhdl) test1
  putStrLn $ concatMap (`applyTest` VHDL_G.writeGraphVhdl) test2
  where
    -- args: A graphML file, the string which should result, the function which maps the file to result
    applyTest :: (BS.ByteString, String) -> (P.Pangraph -> String) -> String
    applyTest (raw, sample) f =
      if show (GraphML_P.unsafeParse raw) == sample
        then error $ "!VHDL failed test : "
                   ++ show sample
                   ++ "\n!=\n"
                   ++ show (GraphML_P.unsafeParse raw)
        else "-VHDL passed test\n"
