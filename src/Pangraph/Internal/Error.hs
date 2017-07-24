module Pangraph.Internal.Error (
edgeError,
parseError
) where

import Pangraph
import qualified Data.ByteString  as BS



edgeError :: [MalformedEdge] -> PangraphError
edgeError = EdgeError

parseError :: BS.ByteString -> PangraphError
parseError = ParseError
