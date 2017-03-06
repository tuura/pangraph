module Pangraph (
Pangraph,
Node,
Edge,
Att,
attributes,
nodes,
edges,
key,
value
) where

import qualified Data.ByteString as BS

data Pangraph = Pangraph [Node] [Edge]
data Node = Node [Att]
data Edge = Edge [Att]
data Att = Att (BS.ByteString, BS.ByteString)

class HasAtt a where
  attributes:: a -> [Att]

instance HasAtt Node where
  attributes (Node a) = a
instance HasAtt Edge where
  attributes (Edge a) = a

nodes::Pangraph -> [Node]
nodes (Pangraph ns _)= ns

edges::Pangraph -> [Edge]
edges (Pangraph _ es)= es

key::Att -> BS.ByteString
key (Att a) = fst a

value::Att -> BS.ByteString
value (Att a) = snd a
