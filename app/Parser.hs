module Main where

import MyXML
import Text.Parsec
import System.IO


main::IO()
main=do
  putStrLn "File name:"
  path <- getLine
  x <- readFile path
  let z = parse fileParse path x
  putStrLn $ show z
  -- putStrLn $ show ( (head (rights [z])))
  putStrLn "complete"
