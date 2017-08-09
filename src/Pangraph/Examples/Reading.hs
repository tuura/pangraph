module Pangraph.Examples.Reading where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import qualified Pangraph.GraphML.Parser as GraphML

main :: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  print (GraphML.parse file)
