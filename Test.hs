module Main where

import qualified Pangraph.XMLTemplate as PT
import qualified Pangraph as P
import qualified Text.XML.Hexml as H

import Data.Either

main :: IO ()
main = do
  x <- readFile "examples/graphs/small.graphml"
  let bs = head $ rights [H.parse $ PT.strToByteString x]
  let (nodes, e) = PT.resolvePath bs n
  let nodes' =map (\h -> PT.getAttPairs h e) nodes
  putStr "#-\t"
  putStrLn $ show nodes
  putStr "#-\t"
  putStrLn $ show nodes'
  where
    n::(PT.Path, PT.Element)
    n =(PT.strToByteString "graphml graph node", PT.strToByteString "id")
