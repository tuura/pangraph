{-|
Module          : Pangraph.Internal.ProtoGraph
Description     : Boilerplate for constructing Pangraphs

This module provides common boilerplate
code which implements constructing a Pangraph from 
either ASTs or Graph types.

It is exported as internal for now as it is intended 
use by modules which will not re-export it.
-}
{-# LANGUAGE OverloadedStrings #-}


module Pangraph.Internal.ProtoGraph 
    ( ProtoVertex()
    , ProtoEdge()
    , makeProtoVertex
    , makeProtoEdge
    , protoVertexAttributes
    , protoEdgeAttributes
    , BuildPangraph()
    , buildPangraph
    , getProtoEdge
    , getProtoVertex
    ) where

import Pangraph

class BuildPangraph t where
    getProtoVertex :: t -> [ProtoVertex]
    getProtoEdge :: t -> [ProtoEdge]

newtype ProtoGraphStage1 = ProtoGraphStage1 (Maybe Pangraph)
    deriving (Eq)

newtype ProtoGraphStage2 = ProtoGraphStage2 (Maybe Pangraph)
    deriving (Eq)

newtype ProtoEdge = ProtoEdge [Attribute]
    deriving (Eq)

newtype ProtoVertex = ProtoVertex [Attribute]
    deriving (Eq)

instance Show ProtoVertex where
    show (ProtoVertex as) = unwords ["makeProtoVertex", show as]

instance Show ProtoEdge where
    show (ProtoEdge as) = unwords ["makeProtoEdge", show as]

-- | Given an Instance t of the BuildGraph will attempt to construct a Pangraph.
-- This can be used to avoid boilerplate code which is common many implementations.
buildPangraph :: BuildPangraph t => t -> (ProtoVertex -> VertexID) -> (ProtoEdge -> (VertexID, VertexID)) -> Maybe Pangraph
buildPangraph t vf ef = let
    vs = getProtoVertex t
    es = getProtoEdge t
    stage1 = makeProtoGraphStage1 vs vf
    (ProtoGraphStage2 p) = makeProtoGraphStage2 stage1 es ef
    in p

-- | Stage1 add nodes to a Graph.
makeProtoGraphStage1 :: [ProtoVertex] -> (ProtoVertex -> VertexID) -> ProtoGraphStage1
makeProtoGraphStage1 vs f = let 
    vertices :: [Vertex]
    vertices = map (toVertex f) vs
    toVertex fv v = makeVertex (fv v) (protoVertexAttributes v)
    in (ProtoGraphStage1 . (\ a -> makePangraph a [])) vertices

-- | Stage2 add edges to the Graph and return the result.
makeProtoGraphStage2 :: ProtoGraphStage1 -> [ProtoEdge] -> (ProtoEdge -> (VertexID, VertexID)) -> ProtoGraphStage2
makeProtoGraphStage2 (ProtoGraphStage1 p) protoEdges ef = let
    es = map (toEdge ef) protoEdges
    toEdge fe e = makeEdge (fe e) (protoEdgeAttributes e)
    s2 = fmap vertexList p >>= \ vs -> makePangraph vs es
    in ProtoGraphStage2 s2

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

