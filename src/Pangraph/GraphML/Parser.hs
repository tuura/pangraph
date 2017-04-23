module Pangraph.GraphML.Parser
( parseGraph
, template
, PT.Template
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS
import qualified Pangraph.XMLTemplate as PT

parseGraph:: PT.Template -> BS.ByteString -> Either BS.ByteString P.Pangraph
parseGraph t file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.parseFromTemplate t x

template:: [PT.Template]
template = PT.graphMLTemplate
