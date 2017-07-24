module Pangraph.Internal.Hexml (
hexmlParse
) where

import Pangraph
import qualified Pangraph.Internal.Error as E
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS

hexmlParse :: BS.ByteString -> Either PangraphError H.Node
hexmlParse t = case H.parse t of
  Left hexmlError -> Left $ E.parseError hexmlError
  Right x -> Right x
