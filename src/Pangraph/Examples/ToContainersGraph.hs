module Pangraph.Examples.ToContainersGraph where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import qualified Pangraph.GraphML.Parser as GraphML
import qualified Pangraph.Containers as CGraph

main :: IO ()
main = do
  fileName <- getLine
  -- Read the files as ByteString
  file <- readFile fileName
  -- Transform to Pangraph and print
  let pangraph = GraphML.unsafeParse file
  -- Transform to Containers Data.Graph and print.
  print $ ((\(a,_,_) -> a) . CGraph.toContainerGraph) pangraph
