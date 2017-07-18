{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.Graph (
-- Abstract Types
Pangraph,
Edge,
Vertex,
Attribute, -- A type alias for (Key, Value)
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
mapEdges,
mapVertices,

-- Getters on Vertex and Edge
edgeAttributes,
edgeEndpoints,
vertexAttributes,
edgeID,
vertexID,

-- Operators
insertVertex,
insertEdge,
lookupVertexValues,
lookupEdgeValues,
vertexByID,
edgeByID,
vertexToAssocList,
edgeToAssocList
) where

import Data.ByteString.Char8 (pack, unpack)
import Data.List (intercalate)
import Data.Map.Strict (Map)
import qualified Data.ByteString                  as BS
import qualified Data.Map.Strict                  as Map

data Pangraph = Pangraph
  { vertices' :: Map VertexID Vertex
  , edges' :: Map Int Edge
  , nextEdge' :: EdgeID
  } deriving (Eq)
data Vertex = Vertex
  { vertexID' :: VertexID
  , vertexAttributes' :: [Attribute]
  } deriving (Eq)
data Edge = Edge
  { edgeID' :: Maybe Int
  , edgeAttributes' :: [Attribute]
  , endpoints' :: (Vertex, Vertex)
  } deriving (Eq)

type VertexID = BS.ByteString
type EdgeID = Int
type Attribute = (Key, Value)
type Key = BS.ByteString
type Value = BS.ByteString

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Pangraph
makePangraph vs es = Pangraph (Map.fromList indexVertices) edgeMap (1 + Map.size edgeMap)
  where
    edgeMap :: Map EdgeID Edge
    edgeMap = Map.fromList indexEdges
    indexVertices :: [(VertexID, Vertex)]
    indexVertices = zip (map vertexID vs) vs
    indexEdges :: [(EdgeID, Edge)]
    indexEdges = map (\ (i, (Edge _ as a)) -> (i, (Edge (Just i) as a ))) $ zip [0..] es

-- The nothing occupies the Identifier field until they are all gathered an IDed.

makeEdge :: [Attribute] -> (Vertex, Vertex) -> Edge
makeEdge = Edge Nothing

makeVertex :: VertexID -> [Attribute] -> Vertex
makeVertex = Vertex

-- Getters

edges :: Pangraph -> [Edge]
edges p = map snd $ Map.toList $ edges' p

vertices :: Pangraph -> [Vertex]
vertices p = map snd $ Map.toList $ vertices' p

mapEdges :: Pangraph -> Map EdgeID Edge
mapEdges = edges'

mapVertices :: Pangraph -> Map VertexID Vertex
mapVertices = vertices'

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints = endpoints'

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'

edgeID :: Edge -> EdgeID
edgeID edge =
  case edgeID' edge of
    Just a -> a
    Nothing -> error $ "Fatal: Edge missing ID, " ++ show edge

vertexID :: Vertex -> VertexID
vertexID = vertexID'

-- Operations on Pangraph

insertVertex :: Vertex -> Pangraph -> Pangraph
insertVertex v p = Pangraph (newMap) (mapEdges p) (nextEdge' p)
  where
    newMap :: Map VertexID Vertex
    newMap = Map.insert (vertexID v) v (mapVertices p)

insertEdge :: Edge -> Pangraph -> Pangraph
insertEdge e@(Edge (Just _) _ _) p =
  let newMap = Map.insert (edgeID e) e (mapEdges p)
  in  Pangraph (mapVertices p) newMap (nextEdge' p)
insertEdge (Edge Nothing as a) p =
  Pangraph (mapVertices p) newMap (1 + nextEdge' p)
  where
    newMap :: Map Int Edge
    newMap = Map.insert (fst addEdgeID) (snd addEdgeID) (mapEdges p)
    addEdgeID :: (Int, Edge)
    addEdgeID = (nextEdge' p, (Edge (Just (nextEdge' p)) as a))

lookupVertexValues :: Vertex -> Key -> Maybe Value
lookupVertexValues v k = lookup k (vertexAttributes v)

lookupEdgeValues :: Edge -> Key -> Maybe Value
lookupEdgeValues e k = lookup k (edgeAttributes e)

vertexByID :: VertexID -> Pangraph -> Maybe Vertex
vertexByID key p = Map.lookup key (mapVertices p)

edgeByID :: EdgeID -> Pangraph -> Maybe Edge
edgeByID key p = Map.lookup key (mapEdges p)

vertexToAssocList :: [Vertex] -> [(VertexID, Vertex)]
vertexToAssocList vs = map (\v -> (vertexID v, v)) vs

edgeToAssocList :: [Edge] -> [(EdgeID, Edge)]
edgeToAssocList es = map (\e -> (edgeID e, e)) es

instance Show Pangraph where
  show p = "Pangraph " ++ show (vertices p) ++ " " ++ show (edges p)

instance Show Vertex where
  show v@(Vertex _ as) = intercalate " " ["Vertex", show (vertexID v), show as]

instance Show Edge where
  show e@(Edge _ as ends) = intercalate " " ["Edge", show (edgeID e) ,show as] -- show tupleID]
    -- where
    --   tupleID :: (VertexID, VertexID)
    --   tupleID = (vertexID' $ fst ends ,vertexID' $ snd ends)
