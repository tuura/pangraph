{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.Graph (
-- Abstract Types
Pangraph,
Edge,
Vertex,
Attribute, -- A type alias for (Key, Value)
Key,
Value,
Identifier,

-- Constructors
makePangraph,
makeEdge,
makeVertex,
-- makeKey,
-- makeValue,

-- Pangraph Getters
edges,
vertices,
mapEdges,
mapVertices,

-- Getters on Vertex and Edge
edgeAttributes,
edgeEndpoints,
vertexAttributes,
edgeID,
vertexID,

-- Getters on Attributes
-- key,
-- value
) where

import Data.Map.Strict (Map)
import Data.List (intercalate)
import Data.ByteString.Char8 (pack)
import qualified Data.Map.Strict                  as Map
import qualified Data.ByteString                  as BS

data Pangraph = Pangraph
  { vertices' :: Map Identifier Vertex
  , edges' :: Map Identifier Edge
  } deriving (Eq)
data Vertex = Vertex
  { vertexID' :: Identifier
  , vertexAttributes' :: [Attribute]
  } deriving (Eq)
data Edge = Edge
  { edgeID' :: Maybe Identifier
  , edgeAttributes' :: [Attribute]
  , endpoints' :: (Vertex, Vertex)
  } deriving (Eq)

type Identifier = BS.ByteString
type Attribute = (Key, Value)
type Key = BS.ByteString
type Value = BS.ByteString

-- newtype Key = Key BS.ByteString deriving (Eq, Ord, Show)
-- newtype Value = Value BS.ByteString deriving (Eq, Ord, Show)

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Pangraph
makePangraph vs es = Pangraph (Map.fromList indexVertices) (Map.fromList indexEdges)
  where
    indexVertices :: [(Identifier, Vertex)]
    indexVertices = zip (map vertexID vs) vs
    indexEdges :: [(Identifier, Edge)]
    indexEdges = map (\ (i, (Edge _ as a)) -> (i, (Edge (Just i) as a ))) $ zip indexList es
    indexList = (map (pack . show) [0..]) :: [Identifier]

-- The nothing nothing occupies the Identifier field.
makeEdge :: [Attribute] -> (Vertex, Vertex) -> Edge
makeEdge = Edge Nothing

makeVertex :: Identifier -> [Attribute] -> Vertex
makeVertex = Vertex

-- Other Constructors

-- makeKey :: BS.ByteString -> Key
-- makeKey = Key
--
-- makeValue :: BS.ByteString -> Value
-- makeValue = Value

-- Getters

mapEdges :: Pangraph -> Map Identifier Edge
mapEdges p = edges' p

mapVertices :: Pangraph -> Map Identifier Vertex
mapVertices p = vertices' p

edges :: Pangraph -> [Edge]
edges p = map snd $ Map.toList $ edges' p

vertices :: Pangraph -> [Vertex]
vertices p = map snd $ Map.toList $ vertices' p

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'
edgeID :: Edge -> Identifier

vertexID :: Vertex -> Identifier
vertexID = vertexID'

edgeID edge =
  case edgeID' edge of
    Just a -> a
    Nothing -> error $ "Fatal: Edge missing ID, " ++ show edge

edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints = endpoints'

-- key :: Key -> BS.ByteString
-- key (Key a) = a
--
-- value :: Value -> BS.ByteString
-- value (Value a) = a

instance Show Pangraph where
  show p = "Pangraph " ++ show (vertices p) ++ " " ++ show (edges p)

instance Show Vertex where
  show v@(Vertex _ as) = intercalate " " ["Vertex", show (vertexID v), show as]

instance Show Edge where
  show e@(Edge _ as ends) = intercalate " " ["Edge", show (edgeID e) ,show as] -- show tupleID]
    where
      tupleID :: (Identifier, Identifier)
      tupleID = (vertexID' $ fst ends ,vertexID' $ snd ends)
