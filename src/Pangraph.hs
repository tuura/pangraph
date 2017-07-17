{-# LANGUAGE OverloadedStrings #-}

module Pangraph (
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

-- Getters on Vertex and Edge
edgeAttributes,
edgeEndpoints,
vertexAttributes,
edgeID,
vertexID,

-- Getters on Attributes
-- key,
-- value,

lookupVertexValues,
lookupEdgeValues,
toAssocList
) where

import Pangraph.Internal.Graph
import Data.List
import Data.Map.Strict (Map)
import qualified Data.Map.Strict                  as Map

lookupVertexValues :: Vertex -> Key -> Maybe Value
lookupVertexValues v k = lookup k (vertexAttributes v)

lookupEdgeValues :: Edge -> Key -> Maybe Value
lookupEdgeValues e k = lookup k (edgeAttributes e)

vertexByID :: Identifier -> Pangraph -> Maybe Vertex
vertexByID key p = Map.lookup key (mapVertices p)

edgeByID :: Identifier -> Pangraph -> Maybe Edge
edgeByID key p = Map.lookup key (mapEdges p)

toAssocList :: [Vertex] -> [(Identifier, Vertex)]
toAssocList vs = map (\v -> (vertexID v, v)) vs
