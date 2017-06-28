{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString                  as BS
import qualified Pangraph                         as P
import qualified Pangraph.GraphML.Parser          as GraphML_P
import qualified Pangraph.VHDL.EnvironmentWriter  as VHDL_E
import qualified Pangraph.VHDL.GraphWriter        as VHDL_G


type Parser = GraphML_P.Template -> BS.ByteString -> Either BS.ByteString P.Pangraph

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
  where

testShowInstance :: IO ()
testShowInstance = case a == (show b) of
  True -> putStrLn "-Pangraph show instance passed."
  False -> error $ "!Show instance failed test: " ++ show b ++ "!=" ++ a
  where
    a = fst showInstanceTestCase
    b = snd showInstanceTestCase
    showInstanceTestCase :: (String, P.Pangraph)
    showInstanceTestCase = ("Pangraph [Node [Attribute (\"id\",\"0\")],Node [Attribute (\"id\",\"1\")]] [Edge [Attribute (\"source\",\"0\"),Attribute (\"target\",\"1\")]]",
     P.makePangraph [P.makeNode [P.makeAttribute ("id","0")],P.makeNode [P.makeAttribute ("id","1")]] [P.makeEdge [P.makeAttribute ("source","0"),P.makeAttribute ("target","1")]])
    -- Without escapes:
    -- Pangraph [Node [Attribute ("id","0")],Node [Attribute ("id","1")]] [Edge [Attribute ("source","0"),Attribute ("target","1")]]

testGraphML :: IO ()
testGraphML = do
  file <- fmap pack $ readFile path
  case (parser (head GraphML_P.template) file) of
    Left x -> error (show x)
    Right y -> if y == graphs
      then putStrLn "-Parse Passed"
      else error $ "!Test failed\n" ++ show y
  where
    path :: FilePath
    path = "examples/graphs/small.graphml"
    parser :: Parser
    parser = GraphML_P.parseTemplateToPangraph
    graphs :: P.Pangraph
    graphs =
      P.makePangraph
        [P.makeNode [P.makeAttribute ("id","n0")],
        P.makeNode [P.makeAttribute ("id","n1")],
        P.makeNode [P.makeAttribute ("id","n2")]]
        [P.makeEdge
          [P.makeAttribute ("source","n0"),
          P.makeAttribute ("target","n2")]]

testVHDL :: IO ()
testVHDL = do
  files <- mapM BS.readFile graphPaths
  vhdlEnvironment <- mapM readFile enviromentPaths
  vhdlGraph <- mapM readFile networkPaths
  let test1 = zip files vhdlEnvironment
  let test2 = zip files vhdlGraph
  putStrLn $ concatMap (\a -> applyTest a VHDL_E.writeEnvironmentVhdl) test1
  putStrLn $ concatMap (\a -> applyTest a VHDL_G.writeGraphVhdl) test2

  where
    -- args: A graphML file, the string which should result, the function which maps the file to result
    applyTest :: (BS.ByteString, String) -> (P.Pangraph -> String) -> String
    applyTest (g, example) f = case (parser (head GraphML_P.template) g ) of
        Left x -> error (show x)
        Right p -> case example == f p of
            True -> "-VHDL passed test\n"
            False -> error $ "!VHDL failed test : " ++ show example ++ "\n!=\n" ++ (show $ f p)


    graphPaths :: [FilePath]
    graphPaths = ["examples/graphs/n1/n1.graphml",
      "examples/graphs/n2/n2.graphml"]
    enviromentPaths :: [FilePath]
    enviromentPaths = ["examples/graphs/n1/n1-sim-environment.vhdl",
      "examples/graphs/n2/n2-sim-environment.vhdl"]
    networkPaths :: [FilePath]
    networkPaths = ["examples/graphs/n1/n1-graph.vhdl",
      "examples/graphs/n2/n2-graph.vhdl"]
    parser :: Parser
    parser = GraphML_P.parseTemplateToPangraph
