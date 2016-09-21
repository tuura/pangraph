module Main where

import System.IO
import Pangraph as P

main::IO()
main=do
  putStrLn "File name:"
  path <- getLine
  w <- P.readGraph path []
  let z = P.parseGraph w
  putStrLn $ show z
  P.writeGraph "temp\\test.graphml" z
  putStrLn "complete"
