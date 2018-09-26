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
        isVertex :: H.Node -> Bool
        isVertex h'= (H.attributeValue <$> H.attributeBy h' "class") == Just "org.workcraft.plugins.graph.Vertex"
        extractVertexData :: H.Node -> [Attribute]
        extractVertexData = map (H.convertAtt . fromJust) . H.attributesBy ["ref"]
        traverseNodeTree :: [[Attribute]]
        traverseNodeTree = H.followChildrenFilterThenApplyFunction h xmlNodePath isVertex extractVertexData 
        in map makeProtoVertex traverseNodeTree

    -- <node class="org.workcraft.dom.math.MathConnection" ref="con0">
    --   <MathConnection first="v1" second="v0"/>
    -- </node>
    getProtoEdge (WorkcraftAST h) = let
        isEdge :: H.Node -> Bool
        isEdge h'= (H.attributeValue <$> H.attributeBy h' "class") == Just "org.workcraft.dom.math.MathConnection"
        extractEdgeData :: H.Node -> [Attribute]
        extractEdgeData h' = let
            child = (head $ H.followChildren h' ["node", "MathConnection"])
            in map (H.convertAtt . fromJust)
                (H.attributesBy ["ref"] h' 
                ++ H.attributesBy ["first", "second"] child)
                    
        in map makeProtoEdge $ H.followChildrenFilterThenApplyFunction h xmlNodePath isEdge extractEdgeData

hexmlParse :: ByteString -> WorkcraftAST
hexmlParse = WorkcraftAST . getRealRoot . H.hexmlParse

getRealRoot :: H.Node -> H.Node
getRealRoot h = H.children h !! 1

xmlNodePath :: [ByteString]
xmlNodePath = ["model", "root", "node"]