module Pangraph.GraphML.Parser (
graphmlToPangraph,
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS
import qualified Pangraph.XMLTemplate as PT
import qualified Algebra.Graph.HigherKinded.Class as H

graphmlToPangraph :: BS.ByteString -> Either BS.ByteString P.Pangraph
graphmlToPangraph file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.hexmlToPangraph PT.graphMLTemplate x
