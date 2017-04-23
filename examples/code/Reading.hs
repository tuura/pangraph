module Reading where

import qualified Pangraph.GraphML.Parser as GraphML_P
import Data.ByteString.Char8 (pack)

main:: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName
  let graph = GraphML_P.parseGraph (head GraphML_P.template) $ pack file
  case graph of
    Left x -> putStrLn (show x)
    Right y -> putStrLn (show y)
