module Pangraph.GraphML.Parser(
parseGraphToAlga,
parseTemplateToPangraph,
template,
PT.Template
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS
import qualified Pangraph.XMLTemplate as PT
import qualified Algebra.Graph.HigherKinded.Class as H


parseGraphToAlga:: (H.Graph g) => PT.Template -> BS.ByteString -> Either BS.ByteString (g P.Node)
parseGraphToAlga t file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.parseTemplateToAlga t x

parseTemplateToPangraph :: PT.Template -> BS.ByteString -> Either BS.ByteString P.Pangraph
parseTemplateToPangraph t file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.parseTemplateToPangraph t x

template:: [PT.Template]
template = PT.graphMLTemplate
