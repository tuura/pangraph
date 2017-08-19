module Pangraph.Examples.Writing where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import qualified Pangraph.GraphML.Parser as GraphML
import qualified Pangraph.GraphML.Writer as GraphML

main :: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  print $ GraphML.write (GraphML.unsafeParse file)
