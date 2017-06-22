{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString                  as BS
import qualified Pangraph                         as P
import qualified Pangraph.GraphML.Parser          as GraphML_P


type Parser = GraphML_P.Template -> BS.ByteString -> Either BS.ByteString P.Pangraph

main :: IO ()
main = do
  xs <- readFile paths
  putStrLn "Graph examples found, applying parser:"
  putStrLn "Testing begins:"
  let (a ,b) = showInstanceTestCase
  case a == (show b) of
    True -> putStrLn "-Pangraph show instance passed."
    False -> error $ "!Show instance failed test: " ++ show b ++ "!=" ++ a

  -- putStrLn $ show graphs
  putStrLn "GraphML:"
  case runParser parser (pack xs) of
    Left x -> error (show x)
    Right y -> if y == graphs
      then putStrLn "-Parse Passed"
      else error $ "!Test failed\n" ++ show y
  where
    showInstanceTestCase :: (String, P.Pangraph)
    showInstanceTestCase = ("Pangraph [Node [Attribute (\"id\",\"0\")],Node [Attribute (\"id\",\"1\")]] [Edge [Attribute (\"source\",\"0\"),Attribute (\"target\",\"1\")]]", P.makePangraph [P.makeNode [P.makeAttribute ("id","0")],P.makeNode [P.makeAttribute ("id","1")]] [P.makeEdge [P.makeAttribute ("source","0"),P.makeAttribute ("target","1")]])
    -- Without escapes:
    -- Pangraph [Node [Attribute ("id","0")],Node [Attribute ("id","1")]] [Edge [Attribute ("source","0"),Attribute ("target","1")]]
    paths :: FilePath
    paths = "examples/graphs/small.graphml"
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

runParser :: Parser -> BS.ByteString -> Either BS.ByteString P.Pangraph
runParser parser file = parser (head GraphML_P.template) file
