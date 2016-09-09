module Main where

import WorkP
import MyXML
import System.Environment
import Text.Parsec
import Data.Either

main :: IO()
main =do
  path <- getLine
  file <- readFile path
  let z = head $ rights $ [parse fileParse "" file]
  -- putStrLn $show z
  putStrLn $show $ shortenFile z
