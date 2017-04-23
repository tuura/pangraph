{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ByteString.Char8 (pack)
import qualified Data.ByteString as BS
import qualified Pangraph as P
import qualified Pangraph.GraphML.Parser as GraphML_P

type Parser = GraphML_P.Template -> BS.ByteString -> Either BS.ByteString P.Pangraph

main :: IO ()
main = do
  xs <- readFile paths
  case runParser parser (pack xs) of
    Left x -> error (show x)
    Right y -> if y == graphs
      then putStr "Test Passed"
      else error $ "Test failed----\n" ++ show y
  where
    paths = "examples/graphs/small.graphml"
    parser = GraphML_P.parseGraph
    graphs =
      P.makePangraph
        [P.makeNode [P.makeAtt ("id","n0")],
        P.makeNode [P.makeAtt ("id","n1")],
        P.makeNode [P.makeAtt ("id","n2")]]
        [P.makeEdge
          [P.makeAtt ("source","n0"),
          P.makeAtt ("target","n2")]]

runParser :: Parser -> BS.ByteString ->Either BS.ByteString P.Pangraph
runParser p file = p (head GraphML_P.template) $ file
