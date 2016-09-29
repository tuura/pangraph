module Main where

import qualified Pangraph as P
import System.IO

main::IO()
main=do
  putStrLn "Source file:"
  source <- getLine
  w <- P.readGraph source []
  let z = P.parseGraph w
  putStrLn "Destination:"
  dest <- getLine
  P.writeGraph dest z
  putStrLn "complete"
