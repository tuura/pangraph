{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Workcraft.Internal where

import Data.ByteString (ByteString)

import qualified Text.XML.Hexml                 as H
import qualified Pangraph.Internal.HexmlExtra   as H

import Pangraph
import Pangraph.Internal.ProtoGraph

import Data.Maybe (fromJust)

newtype WorkcraftAST = WorkcraftAST H.Node
    deriving (Show)

unwrap :: WorkcraftAST -> H.Node
unwrap (WorkcraftAST n) = n

render :: WorkcraftAST -> ByteString
render (WorkcraftAST h) = H.render h

instance BuildPangraph WorkcraftAST where
    -- <node class="org.workcraft.plugins.graph.Vertex" ref="v0">
    --   <Vertex symbol=""/>
    -- </node>
    getProtoVertex (WorkcraftAST h) = let
        -- Check the class attribute of the node. 
        isVertex :: H.Node -> Bool
        isVertex h'= (H.attributeValue <$> H.attributeBy h' "class") == Just "org.workcraft.plugins.graph.Vertex"
        -- Extract the fields from the node returning the attributes for a pangraph.
        extractVertexData :: H.Node -> [Attribute]
        extractVertexData = map (H.convertAtt . fromJust) . H.attributesBy ["ref"]
        -- Traverse the node tree filtering other nodes and extracting data from them.
        traverseNodeTree :: [[Attribute]]
        traverseNodeTree = H.followChildrenFilterThenApplyFunction h xmlNodePath isVertex extractVertexData 
        -- Build the protoVertices
        in map makeProtoVertex traverseNodeTree

    -- <node class="org.workcraft.dom.math.MathConnection" ref="con0">
    --   <MathConnection first="v1" second="v0"/>
    -- </node>
    getProtoEdge (WorkcraftAST h) = let
        -- Check the class property.
        isEdge :: H.Node -> Bool
        isEdge h'= (H.attributeValue <$> H.attributeBy h' "class") == Just "org.workcraft.dom.math.MathConnection"
        -- Extract values from the attributes and also the relevant values from children.
        extractEdgeData :: H.Node -> [Attribute]
        extractEdgeData h' = let
            -- Find the child node for this Edge
            child = (head $ H.followChildren h' ["node", "MathConnection"])
            -- Concat the lists and ready them for Pangraph constructors.
            in map (H.convertAtt . fromJust)
                (H.attributesBy ["ref"] h' 
                ++ H.attributesBy ["first", "second"] child)
        -- Construct the ProtoEdges.
        in map makeProtoEdge $ H.followChildrenFilterThenApplyFunction h xmlNodePath isEdge extractEdgeData

-- A wrapper for hexmlParse to get around the dummy root returned.
hexmlParse :: ByteString -> WorkcraftAST
hexmlParse = WorkcraftAST . getRealRoot . H.hexmlParse

-- Get the correct root.
getRealRoot :: H.Node -> H.Node
getRealRoot h = H.children h !! 1

-- The nodes to follow for the payload.
xmlNodePath :: [ByteString]
xmlNodePath = ["model", "root", "node"]