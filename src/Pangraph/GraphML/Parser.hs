module Pangraph.GraphML.Parser (
graphmlToPangraph,
graphmlToPangraph'
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS
import qualified Pangraph.XMLTemplate as PT

graphmlToPangraph :: BS.ByteString -> Either BS.ByteString (Either [P.MalformedEdge] P.Pangraph)
graphmlToPangraph file =
  case H.parse file of
    Left x -> Left x
    Right x -> Right $ PT.hexmlToPangraph PT.graphMLTemplate x

graphmlToPangraph' :: BS.ByteString -> P.Pangraph
graphmlToPangraph' file =
  case graphmlToPangraph file of
    Left hexmlError -> error (show hexmlError)
    Right makePangraphResult ->
      case makePangraphResult of
        Left malformedEdges -> error $ "Malformed edges in GraphML: " ++ show malformedEdges
        Right pangraph -> pangraph
