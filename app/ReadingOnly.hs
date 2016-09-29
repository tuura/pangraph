module Main where

import qualified Pangraph as P
import System.IO

main:: IO()
main = do
  putStrLn "Source file:"
  srcPath <- getLine
  graph <- P.readGraph srcPath []
  putStrLn $ show $ P.parseGraph graph
  putStrLn "Complete"
