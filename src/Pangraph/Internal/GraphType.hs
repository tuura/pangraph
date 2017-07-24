module Pangraph.Internal.GraphType where

import Data.Map.Strict (Map)
import qualified Data.Map.Strict                  as Map
import qualified Data.ByteString                  as BS

data Pangraph = Pangraph
  { vertices' :: Map VertexID Vertex
  , edges' :: Map EdgeID Edge
  , nextEdge' :: EdgeID
  } deriving (Eq)
data Vertex = Vertex
  { vertexID' :: VertexID
  , vertexAttributes' :: [Attribute]
  } deriving (Eq)
data Edge = Edge
  { edgeID' :: Maybe EdgeID
  , edgeAttributes' :: [Attribute]
  , endpoints' :: (Vertex, Vertex)
  } deriving (Eq)

type EdgeID = Int
type VertexID = BS.ByteString
type Attribute = (Key, Value)
type Key = BS.ByteString
type Value = BS.ByteString

instance Show Pangraph where
  show p = "makePangraph " ++ (show $ Map.elems (vertices' p)) ++ " " ++ (show $ Map.elems (edges' p))

instance Show Vertex where
  show (Vertex i as) = unwords ["makeVertex", show i, show as]

instance Show Edge where
  show (Edge i as e) = unwords ["makeEdge", show as, show e]
