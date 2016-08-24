module Main where

import Data.List
import Text.Parsec
import System.IO
import Gmlp
-- import Shorten

main :: IO ()
main = do
  putStrLn "File name:"
  file <- getLine
  let path ="graphs/" ++ file ++ ".graphml.xml"
  x <- readFile path
  let y = parse parseFile path x
  putStrLn $ show y
  putStrLn "complete"
