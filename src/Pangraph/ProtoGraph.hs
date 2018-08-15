{-# LANGUAGE OverloadedStrings #-}

module Pangraph.ProtoGraph 
    ( ProtoGraph()
    , ProtoVertex()
    , ProtoEdge()
    , completeGraph
    , completeGraphWithDefault
    , makeProtoGraph
    , makeProtoVertex
    , makeProtoEdge
    , protoVertexAttributes
    , protoEdgeAttributes
    , defaultToVertex
    , defaultToEdge
    ) where

import Data.ByteString(ByteString)
import Data.Maybe(fromJust)
import Pangraph

data ProtoGraph = ProtoGraph
    { protoVertices' :: [ProtoVertex]
    , protoEdges' :: [ProtoEdge]
    } deriving (Eq)

newtype ProtoEdge = ProtoEdge [Attribute]
    deriving (Eq)

newtype ProtoVertex = ProtoVertex [Attribute]
    deriving (Eq)

instance Show ProtoGraph where
    show g = unwords ["makeProtoGraph", (show . protoVertices') g, (show . protoEdges') g]

instance Show ProtoVertex where
    show (ProtoVertex as) = unwords ["makeProtoVertex", show as]

instance Show ProtoEdge where
    show (ProtoEdge as ) = unwords ["makeProtoEdge", show as]

completeGraph :: ProtoGraph -> (ProtoVertex -> VertexID) -> (ProtoEdge -> (VertexID, VertexID)) -> Either [MalformedEdge] Pangraph
completeGraph g fv fe = let
    vertices :: [Vertex]
    vertices =  (map (toVertex fv). protoVertices') g
    edges :: [Edge]
    edges = (map (toEdge fe) . protoEdges') g
    in makePangraph vertices edges
        
completeGraphWithDefault :: ProtoGraph -> Either [MalformedEdge] Pangraph
completeGraphWithDefault g = completeGraph g defaultToVertex defaultToEdge

makeProtoGraph :: [ProtoVertex] -> [ProtoEdge] -> ProtoGraph
makeProtoGraph = ProtoGraph

-- | ProtoEdge constructor
makeProtoEdge :: [Attribute] -> ProtoEdge
makeProtoEdge = ProtoEdge

-- | ProtoVertex constructor
makeProtoVertex :: [Attribute] -> ProtoVertex
makeProtoVertex = ProtoVertex

-- | Returns [`Attribute`] of a `ProtoEdge`
protoEdgeAttributes :: ProtoEdge -> [Attribute]
protoEdgeAttributes (ProtoEdge as) = as

-- | Returns [`Attribute`] of a `ProtoVertex`
protoVertexAttributes :: ProtoVertex -> [Attribute]
protoVertexAttributes (ProtoVertex as) = as

-- | A conversion to a full Vertex type.
toVertex :: (ProtoVertex -> VertexID) -> ProtoVertex -> Vertex
toVertex fv v = makeVertex (fv v) (protoVertexAttributes v)

-- | A conversion to a full Edge type.
toEdge :: (ProtoEdge -> (VertexID, VertexID)) -> ProtoEdge -> Edge
toEdge fe e = makeEdge (fe e) (protoEdgeAttributes e)

defaultToEdge :: ProtoEdge -> (VertexID, VertexID)
defaultToEdge e = let
    lookupAtt :: ByteString -> VertexID
    lookupAtt bs = (fromJust . lookup bs) $ protoEdgeAttributes e
    in (lookupAtt "source", lookupAtt "target")

defaultToVertex :: ProtoVertex -> VertexID
defaultToVertex v = (fromJust . lookup "id") $ protoVertexAttributes v