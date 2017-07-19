{-# LANGUAGE OverloadedStrings #-}

module Pangraph (
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
edgeContainsKey,
vertexContainsKey,

-- Utility Operations
vertexToAssocList,
edgeToAssocList
) where

import Pangraph.Internal.Graph
-- import Data.List
-- import Data.Map.Strict (Map)
-- import qualified Data.Map.Strict                  as Map
