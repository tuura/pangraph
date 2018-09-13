{-|
Module          : Pangraph.Containers
Description     : Convert `Pangraph` into a CGraph.Graph

-}
module Pangraph.Containers
    ( convert
    ) where

import Pangraph

import Data.List        (groupBy, sort)
import Data.Maybe       (fromMaybe)

import qualified Data.Graph         as CGraph
import           Data.Map.Strict    (Map)
import qualified Data.Map.Strict    as Map

-- | Transforms a 'Pangraph' into a 'CGraph.Graph'.
convert :: Pangraph -> (CGraph.Graph, CGraph.Vertex -> (Vertex, VertexID, [VertexID]), VertexID -> Maybe CGraph.Vertex)
convert p = let
    -- Create an Edge Map using VertexID grouping edge sources together.
    edgeMap :: Map VertexID [VertexID]
    edgeMap = (Map.fromList . groupIDs . map edgeEndpoints . edgeList) p

    -- Lookup the edges for this vertex. Returning empty list on Nothing. Which means there are no outgoing arcs.
    vertexConnections :: Vertex -> [VertexID]
    vertexConnections v = fromMaybe [] (Map.lookup (vertexID v) edgeMap)

    -- Convert Pangraph Vertex into a form ready to collect Edges from the Pangraph
    getVertices :: [(Vertex, VertexID, [VertexID])]
    getVertices = map (\v ->(v, vertexID v, vertexConnections v)) $ vertexList p
    in CGraph.graphFromEdges getVertices

groupIDs :: [(VertexID, VertexID)] -> [(VertexID, [VertexID])]
groupIDs endPoints =let
    groupedEdges :: [[(VertexID, VertexID)]]
    groupedEdges = groupBy (\a b -> fst a == fst b) (sort endPoints)
    in map (\ts -> (fst $ head ts, map snd ts)) groupedEdges