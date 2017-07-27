module Pangraph.Examples.Reading where

import Prelude hiding (readFile)

import Data.ByteString (readFile)

import Pangraph
import qualified Pangraph.GraphML.Parser as GraphML_P

main :: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  putStrLn $ (show . GraphML_P.parse) file
