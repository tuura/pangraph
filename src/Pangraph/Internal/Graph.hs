{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.Graph (
-- Abstract Types
Pangraph,
MalformedEdge,
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
vertexByID,
edgeByID,

-- -- Operations on Pangraph
-- addEdge,
-- updateEdge,
-- insertVertex,
-- removeEdge,
-- removeVertex,

-- Getters on Vertex and Edge
edgeAttributes,
vertexAttributes,
edgeEndpoints,
edgeID,
vertexID,
lookupVertexValues,
lookupEdgeValues,
vertexContainsKey,
edgeContainsKey,

-- Utility Operations
vertexToAssocList,
edgeToAssocList

) where

import Data.Map.Strict (Map)
import Data.List (intercalate)
import Data.Maybe (catMaybes, mapMaybe, fromMaybe)
import Data.ByteString.Char8 (pack, unpack)
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

type VertexID = BS.ByteString
type EdgeID = Int
type Attribute = (Key, Value)
type Key = BS.ByteString
type Value = BS.ByteString
type MalformedEdge = (Edge, (Maybe Vertex, Maybe Vertex))

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Either [MalformedEdge] Pangraph
makePangraph vs es = case verifyGraph vertexMap es of
  [] -> Right $ Pangraph vertexMap edgeMap (1 + Map.size edgeMap)
  abberrations -> Left abberrations
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

mapEdges :: Pangraph -> Map EdgeID Edge
mapEdges = edges'

mapVertices :: Pangraph -> Map VertexID Vertex
mapVertices = vertices'

edgeByID :: EdgeID -> Pangraph -> Maybe Edge
edgeByID key p = Map.lookup key (mapEdges p)

vertexByID :: VertexID -> Pangraph -> Maybe Vertex
vertexByID key p = Map.lookup key (mapVertices p)

-- -- Operations on Pangraph
--
-- addEdge :: Edge -> Pangraph -> Pangraph
-- addEdge (Edge (Just _) _ _) _ = error $ "Edge already has an ID, perhaps you should use `updateEdge`"
-- addEdge (Edge Nothing as a) p =
--   Pangraph (mapVertices p) newMap (1 + nextEdge' p)
--   where
--     newMap :: Map Int Edge
--     newMap = Map.insert (edgeID addEdgeID) (addEdgeID) (mapEdges p)
--     addEdgeID :: Edge
--     addEdgeID = (Edge (Just (nextEdge' p)) as a)
--
-- updateEdge :: Edge -> Pangraph -> Pangraph
-- updateEdge e p =
--   let newMap = Map.insert (edgeID e) e (mapEdges p)
--   in  Pangraph (mapVertices p) newMap (nextEdge' p)
--
-- insertVertex :: Vertex -> Pangraph -> Pangraph
-- insertVertex v p = Pangraph (newMap) (mapEdges p) (nextEdge' p)
--   where
--     newMap :: Map VertexID Vertex
--     newMap = Map.insert (vertexID v) v (mapVertices p)
--
-- removeEdge :: Edge -> Pangraph -> Maybe Pangraph
-- removeEdge e p = Map.
--
-- removeVertex :: Vertex -> Pangraph -> Maybe Pangraph

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'

edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints = endpoints'

edgeID :: Edge -> EdgeID
edgeID edge = fromMaybe
  (error $ "Fatal: Edge missing ID, " ++ show edge)
  (edgeID' edge)


vertexID :: Vertex -> VertexID
vertexID = vertexID'

lookupVertexValues :: Vertex -> Key -> Maybe Value
lookupVertexValues v k = lookup k (vertexAttributes v)

lookupEdgeValues :: Edge -> Key -> Maybe Value
lookupEdgeValues e k = lookup k (edgeAttributes e)

-- Utility Operations

vertexToAssocList :: [Vertex] -> [(VertexID, Vertex)]
vertexToAssocList = map (\v -> (vertexID v, v))

edgeToAssocList :: [Edge] -> [(EdgeID, Edge)]
edgeToAssocList = map (\e -> (edgeID e, e))

edgeContainsKey :: Key -> Edge -> Bool
edgeContainsKey k e = elem k $ map fst $ edgeAttributes e

vertexContainsKey :: Key -> Vertex -> Bool
vertexContainsKey k v = elem k $ map fst $ vertexAttributes v

instance Show Pangraph where
  show p = "Pangraph " ++ show (vertices p) ++ " " ++ show (edges p)

instance Show Vertex where
  show v@(Vertex _ as) = unwords ["Vertex", show (vertexID v), show as]

instance Show Edge where
  show e@(Edge _ as ends) = unwords ["Edge", show (edgeID e) ,show as] -- show tupleID]
    -- where
    --   tupleID :: (Identifier, Identifier)
    --   tupleID = (vertexID' $ fst ends ,vertexID' $ snd ends)
