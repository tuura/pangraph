module Pangraph (
Pangraph,
Node,
Edge,
Att,
getAtt,
getNodes,
getEdges
getBytestring
) where

import qualified Data.ByteString as BS

data Pangraph = Pangraph [Node] [Edge]
data Node = Node [Att]
data Edge = Edge [Att]
data Att = Att (BS.ByteString, BS.ByteString)

class HasAtt a where
  getAtt:: a -> [Att]

instance HasAtt Node where
  getAtt (Node a) = a
instance HasAtt Edge where
  getAtt (Edge a) = a

getNodes::Pangraph -> [Node]
getNodes (Pangraph ns _)= ns

getEdges::Pangraph -> [Edge]
getEdges (Pangraph _ es)= es

getBytestring::Att -> (BS.ByteString, BS.ByteString)
getBS (Att a) = a
