module Pangraph.Containers
    ( convert
    ) where

import Pangraph
import qualified Data.Graph as CGraph

import Data.Maybe       (fromMaybe)
import Data.List        (groupBy, sort)
import Control.Arrow    ((***))

import Data.Map.Strict  (Map)
import qualified Data.Map.Strict as Map

-- | Transforms a 'Pangraph' in a 'CGraph.Graph'.
convert :: Pangraph -> (CGraph.Graph, CGraph.Vertex -> (Vertex, VertexID, [VertexID]), VertexID -> Maybe CGraph.Vertex)
convert p = CGraph.graphFromEdges getVertices
  where
    -- A helper function for getting the IDs of endpoints.
    edgeEndpointIDs :: Edge -> (VertexID, VertexID)
    edgeEndpointIDs e = (vertexID *** vertexID) $ edgeEndpoints e

    -- Create an Edge Map using VertexID grouping edge sources together.
    edgeMap :: Map VertexID [VertexID]
    edgeMap = (Map.fromList . groupIDs) $ map edgeEndpointIDs $ edgeList p

    -- Lookup the edges for this vertex. Returning empty list on Nothing.
    vertexConnections :: Vertex -> [VertexID]
    vertexConnections v = fromMaybe [] (Map.lookup (vertexID v) edgeMap)

    -- Convert Pangraph Vertex into a form ready to collect Edges from the Pangraph
    getVertices :: [(Vertex, VertexID, [VertexID])]
    getVertices = map (\v ->(v, vertexID v, vertexConnections v)) $ vertexList p

groupIDs :: [(VertexID, VertexID)] -> [(VertexID, [VertexID])]
groupIDs vs = map (\ts -> (fst $ head ts, map snd ts)) groupedEdges
  where
    groupedEdges :: [[(VertexID, VertexID)]]
    groupedEdges = groupBy (\a b -> fst a == fst b) $ sort vs
