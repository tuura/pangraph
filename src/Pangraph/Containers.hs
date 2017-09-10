module Pangraph.Containers
    (  toContainerGraph
    )
    where

import Pangraph
import qualified Data.Graph as CGraph

import Data.Map.Strict(Map)
import qualified Data.Map.Strict as Map

-- | Transforms a 'Pangraph' in a 'CGraph.Graph'.
toContainerGraph :: Pangraph -> (CGraph.Graph, CGraph.Vertex -> (Vertex, VertexID, [VertexID]), VertexID -> Maybe CGraph.Vertex)
toContainerGraph p = CGraph.graphFromEdges getVertices
  where
    -- Create the an Edge Map using VertexID grouping edge sources together.
    edgeMap :: Map VertexID [VertexID]
    edgeMap = (Map.fromList . squashIDs) $ map edgeEndpointIDs $ edgeList p

    -- Lookup the edges for this vertex. Returning empty list on Nothing.
    vertexConnections :: Vertex -> [VertexID]
    vertexConnections v = fromMaybe [] (Map.lookup (vertexID v) edgeMap)


    -- Convert Pangraph Vertex into a form ready to collect Edges from the Pangraph
    getVertices :: [(Vertex, VertexID, [VertexID])]
    getVertices = map (\v ->(v, vertexID v, vertexConnections v)) $ vertexList p

-- A function to group edge endpoints in buckets.
squashIDs :: [(VertexID, VertexID)] -> [(VertexID, [VertexID])]
squashIDs as = Map.toList $ accumMap Map.empty as
  where
    accumMap :: Map VertexID [VertexID] -> [(VertexID, VertexID)] -> Map VertexID [VertexID]
    accumMap t [] = t
    accumMap m (a:c) = accumMap (Map.insertWith (++) (fst a) [snd a] m) c
