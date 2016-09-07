module Main where

import qualified WorkP as W
import qualified Hxt as H

import System.Environment

main :: IO()
main =do
  argv <- getArgs
  H.hxtTest1 argv


  --
  -- t@[src, dst] <- getArgs
  -- W.parseFile t
  -- putStrLn "complete"
