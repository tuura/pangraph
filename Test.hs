{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString                  as BS
import qualified Pangraph                         as P
import qualified Pangraph.GraphML.Parser          as GraphML_P
import qualified Pangraph.VHDL.EnvironmentWriter  as VHDL_E
import qualified Pangraph.VHDL.GraphWriter        as VHDL_G


type Parser = BS.ByteString -> Either BS.ByteString P.Pangraph

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
testShowInstance = case literal == show graph of
  True -> putStrLn "-Pangraph show instance passed."
  False -> error $ "!Show instance failed test: \"" ++ literal ++ "\"\n!=\n\"" ++ show graph ++ "\""
  where
    literal = fst showInstanceTestCase
    graph = snd showInstanceTestCase
    showInstanceTestCase :: (String, P.Pangraph)
    showInstanceTestCase = ("Pangraph [Vertex \"0\" [(\"id\",\"0\")],Vertex \"1\" [(\"id\",\"1\")]] [Edge 0 [(\"source\",\"0\"),(\"target\",\"1\")]]",
     P.makePangraph sampleVertices [P.makeEdge [("source","0"), ("target","1")] (sampleVertices !! 0, sampleVertices !! 1)])
    sampleVertices :: [P.Vertex]
    sampleVertices =
      [P.makeVertex "0" [("id","0")],
       P.makeVertex "1" [ ("id","1")]]
    -- Without escapes:
    -- Pangraph [Vertex "0" [("id","0")],Vertex "1" [("id","1")]] [Edge 0 [("source","0"),("target","1")]]

testGraphML :: IO ()
testGraphML = do
  file <- fmap pack $ readFile path
  case (parser file) of
    Left x -> error (show x)
    Right y -> if y == graphs
      then putStrLn "-Parse Passed"
      else error $ "!Test failed\n" ++ show y
  where
    path :: FilePath
    path = "examples/graphs/small.graphml"
    parser :: Parser
    parser = GraphML_P.graphmlToPangraph
    graphs :: P.Pangraph
    graphs =
      P.makePangraph
        sampleVertices
        [P.makeEdge
          [("source","n0"),
           ("target","n2")] ((sampleVertices !! 0), (sampleVertices !! 2))]
    sampleVertices :: [P.Vertex]
    sampleVertices =
      [ P.makeVertex "n0" [ ("id","n0")],
        P.makeVertex "n1" [ ("id","n1")],
        P.makeVertex "n2" [ ("id","n2")]]

testVHDL :: IO ()
testVHDL = do
  files <- mapM BS.readFile graphPaths
  -- mapM BS.putStrLn $ files
  vhdlEnvironment <- mapM readFile enviromentPaths
  vhdlGraph <- mapM readFile networkPaths
  let test1 = zip files vhdlEnvironment
  let test2 = zip files vhdlGraph
  putStrLn $ concatMap (\a -> applyTest a VHDL_E.writeEnvironmentVhdl) test1
  putStrLn $ concatMap (\a -> applyTest a VHDL_G.writeGraphVhdl) test2
  where
    -- args: A graphML file, the string which should result, the function which maps the file to result
    applyTest :: (BS.ByteString, String) -> (P.Pangraph -> String) -> String
    applyTest (g, example) f = case (parser g) of
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
    parser = GraphML_P.graphmlToPangraph
