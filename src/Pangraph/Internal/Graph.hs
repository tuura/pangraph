module Pangraph.Internal.Graph (
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
lookupVertexValues,
lookupEdgeValues,
vertexContainsKey,
edgeContainsKey,

-- Utility Operations
vertexAssocList,
edgeAssocList

) where

import Data.List             (intercalate)
import Data.Maybe            (catMaybes, mapMaybe, fromMaybe)
import Data.ByteString.Char8 (pack, unpack)
import Data.Map.Strict       (Map)
import qualified Data.Map.Strict  as Map
import qualified Data.ByteString  as BS

import Pangraph.Internal.Error
import Pangraph.Internal.GraphType

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Either PangraphError Pangraph
makePangraph vs es = case verifyGraph vertexMap es of
  [] -> Right $ Pangraph vertexMap edgeMap (1 + Map.size edgeMap)
  abberrations -> Left $ edgeError abberrations
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

-- Consider adding map getters?

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
edgeContainsKey k e = elem k $ map fst $ edgeAttributes e

vertexContainsKey :: Key -> Vertex -> Bool
vertexContainsKey k v = elem k $ map fst $ vertexAttributes v
