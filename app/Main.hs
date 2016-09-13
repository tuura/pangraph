module Main where

import System.IO
import Parsers as P


main::IO()
main=do
  putStrLn "File name:"
  path <- getLine
  putStrLn path
  file <- readFile path
  -- let t =P.pathParser path
  -- putStrLn $ t
  -- putStrLn $ show $ P.parserMultiplexer t
  let z =  P.parseFile file path []
  putStrLn $ show z
  putStrLn "complete"
