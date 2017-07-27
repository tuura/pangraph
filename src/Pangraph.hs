{-# LANGUAGE OverloadedStrings #-}

module Pangraph (
-- Abstract Types
Pangraph,
Edge,
Vertex,
Attribute,
Key,
Value,
VertexID,
EdgeID,

-- Constructors
makePangraph,
makeEdge,
makeVertex,

-- Pangraph Getters
edges,
vertices,
vertexByID,
edgeByID,

-- Getters on Vertex and Edge
edgeAttributes,
vertexAttributes,
edgeEndpoints,
edgeID,
vertexID,

-- Operations on Edge and Vertex
lookupVertexValues,
lookupEdgeValues,
vertexContainsKey,
edgeContainsKey,

-- Utility Operations
vertexAssocList,
edgeAssocList,

) where

import Data.Maybe            (catMaybes, mapMaybe, fromMaybe, isJust)
import Data.ByteString.Char8 (pack, unpack)
import Data.Map.Strict       (Map)
import qualified Data.Map.Strict  as Map
import qualified Data.ByteString  as BS

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
  show p = "makePangraph " ++ show (Map.elems (vertices' p)) ++ " " ++ show (Map.elems (edges' p))

instance Show Vertex where
  show (Vertex i as) = unwords ["makeVertex", show i, show as]

instance Show Edge where
  show (Edge i as e) = unwords ["makeEdge", show as, show e]

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Maybe Pangraph
makePangraph vs es = case verifyGraph vertexMap es of
  [] -> Just $ Pangraph vertexMap edgeMap (1 + Map.size edgeMap)
  abberrations -> Nothing
  where
    vertexMap :: Map VertexID Vertex
    vertexMap = Map.fromList $ zip (map vertexID vs) vs
    edgeMap :: Map EdgeID Edge
    edgeMap = Map.fromList indexEdges
    indexEdges :: [(EdgeID, Edge)]
    indexEdges = map (\ (i, Edge _ as a) -> (i, Edge (Just i) as a )) $ zip [0..] es

verifyGraph :: Map VertexID Vertex -> [Edge] -> [MalformedEdge]
verifyGraph vs = mapMaybe (\e -> lookupEndpoints (e, edgeEndpoints e))
  where
    lookupEndpoints :: (Edge, (Vertex, Vertex)) ->  Maybe MalformedEdge
    lookupEndpoints (e, (v1,v2)) =
      case (Map.lookup (vertexID v1) vs, Map.lookup (vertexID v2) vs) of
        (Just _, Just _)    -> Nothing
        (Nothing, Just _)   -> Just (e, (Just v1, Nothing))
        (Just _, Nothing)   -> Just (e, (Nothing, Just v2))
        (Nothing, Nothing)  -> Just (e, (Just v1, Just v2))

makeEdge :: [Attribute] -> (Vertex, Vertex) -> Edge
makeEdge = Edge Nothing

makeVertex :: VertexID -> [Attribute] -> Vertex
makeVertex = Vertex

edges :: Pangraph -> [Edge]
edges p = Map.elems $ edges' p

vertices :: Pangraph -> [Vertex]
vertices p = Map.elems $ vertices' p

edgeByID :: EdgeID -> Pangraph -> Maybe Edge
edgeByID key p = Map.lookup key $ edges' p

vertexByID :: VertexID -> Pangraph -> Maybe Vertex
vertexByID key p = Map.lookup key $ vertices' p

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'

edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints = endpoints'

edgeID :: Edge -> Maybe EdgeID
edgeID = edgeID'

vertexID :: Vertex -> VertexID
vertexID = vertexID'

lookupVertexValues :: Key -> Vertex -> Maybe Value
lookupVertexValues k v= lookup k (vertexAttributes v)

lookupEdgeValues :: Key -> Edge -> Maybe Value
lookupEdgeValues k e = lookup k (edgeAttributes e)

-- Utility Operations

vertexAssocList :: Pangraph -> [(VertexID, Vertex)]
vertexAssocList p = Map.toList $ vertices' p

edgeAssocList :: Pangraph -> [(EdgeID, Edge)]
edgeAssocList p = Map.toList $ edges' p

edgeContainsKey :: Key -> Edge -> Bool
edgeContainsKey k e = isJust $ lookupEdgeValues k e

vertexContainsKey :: Key -> Vertex -> Bool
vertexContainsKey k v = isJust $ lookupVertexValues k v

data PangraphError
  = EdgeError [MalformedEdge]
  | ParseError BS.ByteString
  deriving (Show)

type MalformedEdge = (Edge, (Maybe Vertex, Maybe Vertex))
