module Pangraph (
Pangraph,
Node,
Edge,
Att,
attributes,
nodes,
edges,
key,
value,
makeAtt,
makeNode,
makeEdge,
makePangraph
) where

import qualified Data.ByteString as BS

data Pangraph = Pangraph [Node] [Edge] deriving (Show)
data Node = Node [Att] deriving (Show)
data Edge = Edge [Att] deriving (Show)
data Att = Att (BS.ByteString, BS.ByteString) deriving (Show)

type Identifier = BS.ByteString
type Field = BS.ByteString

class HasAtt a where
  attributes:: a -> [Att]

instance HasAtt Node where
  attributes (Node a) = a
instance HasAtt Edge where
  attributes (Edge a) = a

-- Pangraph type getters

nodes::Pangraph -> [Node]
nodes (Pangraph ns _)= ns

edges::Pangraph -> [Edge]
edges (Pangraph _ es)= es

key::Att -> BS.ByteString
key (Att a) = fst a

value::Att -> BS.ByteString
value (Att a) = snd a

-- Pangraph type contructors

makeAtt:: Identifier -> Field -> Att
makeAtt i f = Att (i, f)

makeNode:: [Att] -> Node
makeNode as = Node as

makeEdge:: [Att] -> Edge
makeEdge as = Edge as

makePangraph:: [Node] -> [Edge] -> Pangraph
makePangraph ns es = Pangraph ns es
