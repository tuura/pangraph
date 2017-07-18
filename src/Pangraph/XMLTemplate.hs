{-# LANGUAGE OverloadedStrings #-}

module Pangraph.XMLTemplate
( Template,
  graphMLTemplate,
  -- parseTemplateToAlga,
  hexmlToPangraph
) where

import Data.Maybe
import Data.List

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Algebra.Graph.HigherKinded.Class as A

import Data.Word (Word8)
import qualified Data.ByteString as BS

-- A list of places to find nodes and extractEdges.
data Template = XML [NodeRule] [EdgeRule]
-- A list of the locations of tags and which elements to take from them.
data EdgeRule = EdgeRule [(Path, Element)]
data NodeRule = NodeRule [(Path, Element)]

type Path = [BS.ByteString]
type Element = [BS.ByteString]
type HexmlNode = H.Node

-- A template for graphML, it extracts the nodes and edges.
graphMLTemplate :: Template
graphMLTemplate = XML
  [NodeRule [( ["graphml", "graph", "node"], ["id"])]]
  [EdgeRule [( ["graphml", "graph", "edge"], ["source", "target"] )]]

-- parseTemplateToAlga:: (A.Graph g) => Template -> HexmlNode -> g P.Vertex
-- parseTemplateToAlga (XML nt et) root=P.makeAlga (concatMap (nodes root) nt) (concatMap (extractEdges root) et)

hexmlToPangraph :: Template -> HexmlNode -> P.Pangraph
hexmlToPangraph (XML nt et) root = P.makePangraph n e
  where
    -- Map all the given rules over the XML tree for vertices
    n = (concatMap (extractVertices root "id") nt)
    -- Map all the given rules over the XML tree for edges
    e = (concatMap (extractEdges (P.vertexToAssocList n) root ) et)

-- Applies the Node rule to the Hexml root node, returning a list of pangraph nodes found.
extractVertices :: HexmlNode -> BS.ByteString -> NodeRule -> [P.Vertex]
extractVertices hexml idElement (NodeRule pe) = concatMap (makeVertex hexml idElement) pe

makeVertex :: HexmlNode -> BS.ByteString -> (Path, Element) -> [P.Vertex]
makeVertex hexml idElement (path, element) = map (\as -> P.makeVertex (idElem as) as) attList
  where
    idElem :: [P.Attribute] -> P.VertexID
    idElem list = case lookup idElement list of
      Just a -> a
      Nothing -> error $ "Fatal: node missing id value: " ++ show list

    attList :: [[P.Attribute]]
    attList = map (getAttributePairs element) $ resolvePath path hexml

-- Applies the edge rule to the Hexml root edge, returning a list of pangraph extractEdges found.
extractEdges:: [(P.VertexID, P.Vertex)] -> HexmlNode -> EdgeRule -> [P.Edge]
extractEdges verticesAssoc hexml (EdgeRule pe) = concatMap (makeEdge verticesAssoc hexml) pe

makeEdge :: [(P.VertexID, P.Vertex)] ->  HexmlNode -> (Path, Element) -> [P.Edge]
makeEdge verticesAssoc hexml (path, element) = map (\as -> P.makeEdge as (getPrimitives as)) attList
  where
    getPrimitives :: [P.Attribute] -> (P.Vertex, P.Vertex)
    getPrimitives list = case (lookup src list, lookup dst list) of
      (Just srcID, Just dstID) ->
        case (lookup srcID verticesAssoc, lookup dstID verticesAssoc) of
          (Just vertexSrc, Just vertexDst) -> (vertexSrc, vertexDst)
          _ -> error $ "Fatal: Edge endpoints are not nodes: " ++ show list
      _ -> error $ "Fatal: Edge endpoints not found in attribute list: " ++ show list
    attList :: [[P.Attribute]]
    attList = map (getAttributePairs element) $ resolvePath path hexml
    src = "source"
    dst = "target"

resolvePath:: Path -> HexmlNode -> [HexmlNode]
resolvePath [] h = [h]
resolvePath bs h = concatMap (resolvePath (tail bs)) children
  where
    children :: [HexmlNode]
    children = H.childrenBy h $ head bs

getAttributePairs:: Element -> HexmlNode -> [P.Attribute]
getAttributePairs e h = map toAttribute $ catMaybes $ map (H.attributeBy h) e
  where
    toAttribute :: H.Attribute -> P.Attribute
    toAttribute a = (H.attributeName a, H.attributeValue a)
