module Pangraph.Internal.Error (
  PangraphError,
  MalformedEdge,
  edgeError,
  parseError
) where

import Pangraph.Internal.GraphType
import qualified Data.ByteString         as BS

data PangraphError
  = EdgeError [MalformedEdge]
  | ParseError BS.ByteString
  deriving (Show)

type MalformedEdge = (Edge, (Maybe Vertex, Maybe Vertex))
  
edgeError :: [MalformedEdge] -> PangraphError
edgeError = EdgeError

parseError :: BS.ByteString -> PangraphError
parseError = ParseError
