module Pangraph.Examples.Gml where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import qualified Pangraph.Gml.Parser as Gml

main :: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  print (Gml.parse file)
