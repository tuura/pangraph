{-# LANGUAGE OverloadedStrings #-}

module Pangraph (
Pangraph,
Node,
Edge,
Attribute,
attributes,
nodes,
edges,
key,
value,
pair,
valuesByKey,
makeAttribute,
makeNode,
makeEdge,
makePangraph,
makeAlga
) where

-- import Data.List
import qualified Data.ByteString                  as BS
import qualified Algebra.Graph.HigherKinded.Class as H

data Pangraph = Pangraph [Node] [Edge] deriving (Eq)
data Node = Node [Attribute] deriving (Eq)
data Edge = Edge [Attribute] deriving (Eq)
data Attribute = Attribute (BS.ByteString, BS.ByteString) deriving (Eq)

type Key = BS.ByteString
type Value = BS.ByteString
-- Pangraph [Node [Attribute ("id","0")],Node [Attribute ("id","1")]] [Edge [Attribute ("source","0"),Attribute ("target","1")]]

--  Instances of show

instance Show (Pangraph) where
  show p = "Pangraph " ++  (show $ nodes p) ++ " " ++ (show $ edges p)

instance Show (Node) where
  -- show (Node []) = ""
  show n = "Node " ++ (show $ attributes n) -- ++ ", " ++ (show $ tail ns)

instance Show (Edge) where
  -- show (Edge []) = ""
  show e = "Edge " ++ (show $ attributes e) -- ++ ", " ++ (show ns) ++ "]"

instance Show Attribute where
  show a = "Attribute " ++ (show $ pair a)

-- | Pangraph type getters

class HasAttribute a where
  attributes :: a -> [Attribute]

instance HasAttribute Node where
  attributes (Node a) = a
instance HasAttribute Edge where
  attributes (Edge a) = a

nodes :: Pangraph -> [Node]
nodes (Pangraph ns _) = ns

edges :: Pangraph -> [Edge]
edges (Pangraph _ es) = es

key :: Attribute -> Key
key (Attribute a) = fst a

value :: Attribute -> Value
value (Attribute a) = snd a

pair :: Attribute -> (Key, Value)
pair (Attribute a) = a

valuesByKey :: HasAttribute a => a -> Key -> [Value]
valuesByKey ps k = map value (filter (\a -> key a == k) as)
  where
    as :: [Attribute]
    as = attributes ps

nodesById ::  [Node] -> BS.ByteString -> [Node]
nodesById ns str = filter (\n -> str == head (valuesByKey n "id")) ns

-- | Pangraph type contructors

makeAttribute :: (Key , Value) -> Attribute
makeAttribute a = Attribute a

makeNode :: [Attribute] -> Node
makeNode as = Node as

makeEdge :: [Attribute] -> Edge
makeEdge as = Edge as


makePangraph :: [Node] -> [Edge] -> Pangraph
makePangraph ns es = Pangraph ns es

makeAlga :: (H.Graph g) =>  [Node] -> [Edge] -> g Node
makeAlga ns es = H.graph (ns) (map extractSrcAndDest es)
  where
    extractSrcAndDest :: Edge -> (Node, Node)
    extractSrcAndDest e = case (src e, dst e) of
      (Just a, Just b) -> (a ,b)
      _ -> error $ "!Malformed edge: " ++ (show e)
    src :: Edge -> Maybe Node
    src as = case valuesByKey as "source" of
      [] -> Nothing
      t -> Just $ makeNodeWithID $ head t
    dst :: Edge -> Maybe Node
    dst as = case valuesByKey as "target" of
      [] -> Nothing
      t -> Just $ makeNodeWithID $ head t
    makeNodeWithID :: BS.ByteString -> Node
    makeNodeWithID str = makeNode [makeAttribute ("id", str)]
