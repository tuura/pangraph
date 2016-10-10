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
  let vhdl = P.writeVHDL $ P.parseGraph graph
  putStrLn "VHDL output path:"
  vhdlPath <- getLine
  writeFile vhdlPath vhdl
  putStrLn "Complete"
