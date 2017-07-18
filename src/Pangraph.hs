{-# LANGUAGE OverloadedStrings #-}

module Pangraph (
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
addEdge,
updateEdge,
lookupVertexValues,
lookupEdgeValues,
vertexByID,
edgeByID,
vertexToAssocList,
edgeToAssocList
) where

import Pangraph.Internal.Graph
-- import Data.List
-- import Data.Map.Strict (Map)
-- import qualified Data.Map.Strict                  as Map
