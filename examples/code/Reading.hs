module Reading where

import Prelude hiding (readFile)
import Data.ByteString (readFile)
import qualified Pangraph.GraphML.Parser as GraphML_P

main:: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName

  case GraphML_P.graphmlToPangraph file of
    Left hexmlErr-> putStrLn $ show hexmlErr
    Right makePangraph ->
      case makePangraph of
        Left malformedEdges -> putStrLn $ show malformedEdges
        Right pangraph -> putStrLn $ show pangraph
