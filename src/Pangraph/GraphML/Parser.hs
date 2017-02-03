module Pangraph.GraphML.Parser
( parseGraph
)where

import qualified Data.ByteString as BS
import qualified Data.Either as E
import qualified Text.XML.Hexml as H

parseGraph:: BS.ByteString -> Pangraph
parseGraph xs = do

  where
    parsedXML = E.either (\e -> error $ show e) id (H.parse xs)
    getNodes:: Node -> [Edge]
    getNodes n= 
    getArcs:: Node -> [Arc]
    getArcs
