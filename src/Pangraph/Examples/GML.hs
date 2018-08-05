module Pangraph.Examples.GML where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import qualified Pangraph.GML.Parser as GML

main :: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  print (GML.parse file)
