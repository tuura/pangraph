module Pangraph.GraphML.Parser (
-- parseGraphToAlga,
graphmlToPangraph,
-- template,
-- PT.Template
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS
import qualified Pangraph.XMLTemplate as PT
import qualified Algebra.Graph.HigherKinded.Class as H


-- parseGraphToAlga:: (H.Graph g) => PT.Template -> BS.ByteString -> Either BS.ByteString (g P.Node)
-- parseGraphToAlga t file =
--   case H.parse file of
--     Left x -> Left x
--     Right x -> Right $ PT.parseTemplateToAlga t x

graphmlToPangraph :: BS.ByteString -> Either BS.ByteString P.Pangraph
graphmlToPangraph file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.hexmlToPangraph PT.graphMLTemplate x
