module Pangraph.Internal.Hexml (
hexmlParse
) where

import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS

hexmlParse :: BS.ByteString -> Maybe H.Node
hexmlParse t = case H.parse t of
  Left _ -> Nothing
  Right hexmlNode -> Just hexmlNode
