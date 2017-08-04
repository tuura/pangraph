{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.XMLTemplate
( Template,
  graphMLTemplate,
  hexmlToPangraph
) where

import Data.Maybe
import Data.List

import qualified Pangraph as P
import qualified Text.XML.Hexml as H

import Data.Word (Word8)
import qualified Data.ByteString as BS

-- A list of places to find vertices and extractEdges.
data Template = XML [VertexRule] [EdgeRule]
-- A list of the locations of tags and which elements to take from them.
newtype EdgeRule = EdgeRule [(Path, Element)]
newtype VertexRule = VertexRule [(Path, Element)]

type Path = [BS.ByteString]
type Element = [BS.ByteString]
type HexmlVertex = H.Node

-- A template for graphML, it extracts the vertices and edges.
graphMLTemplate :: Template
graphMLTemplate = XML
  [VertexRule [( ["graphml", "graph", "node"], ["id"])]]
  [EdgeRule [( ["graphml", "graph", "edge"], ["source", "target"] )]]

hexmlToPangraph :: Template -> HexmlVertex -> Maybe P.Pangraph
hexmlToPangraph (XML nt et) root = P.makePangraph n e
  where
    -- Map all the given rules over the XML tree for vertices
    n = concatMap (extractVertices root "id") nt
    -- Map all the given rules over the XML tree for edges
    e = concatMap (extractEdges (assocVertices n) root ) et
    assocVertices :: [P.Vertex] -> [(P.VertexID, P.Vertex)]
    assocVertices vs = zip (map P.vertexID vs) vs

-- Applies the Vertex rule to the Hexml root node, returning a list of pangraph vertices found.
extractVertices :: HexmlVertex -> BS.ByteString -> VertexRule -> [P.Vertex]
extractVertices hexml idElement (VertexRule pe) = concatMap (makeVertex hexml idElement) pe

makeVertex :: HexmlVertex -> BS.ByteString -> (Path, Element) -> [P.Vertex]
makeVertex hexml idElement (path, element) = map (\as -> P.makeVertex (idElem as) as) attList
  where
    idElem :: [P.Attribute] -> P.VertexID
    idElem list =  fromMaybe (error $ "Fatal: node missing id value: " ++ show list)
      (lookup idElement list)


    attList :: [[P.Attribute]]
    attList = map (getAttributePairs element) $ resolvePath path hexml

-- Applies the edge rule to the Hexml root edge, returning a list of pangraph extractEdges found.
extractEdges:: [(P.VertexID, P.Vertex)] -> HexmlVertex -> EdgeRule -> [P.Edge]
extractEdges verticesAssoc hexml (EdgeRule pe) = concatMap (makeEdge verticesAssoc hexml) pe

makeEdge :: [(P.VertexID, P.Vertex)] ->  HexmlVertex -> (Path, Element) -> [P.Edge]
makeEdge verticesAssoc hexml (path, element) = map (\as -> P.makeEdge as (getPrimitives as)) attList
  where
    getPrimitives :: [P.Attribute] -> (P.Vertex, P.Vertex)
    getPrimitives list = case (lookup src list, lookup dst list) of
      (Just srcID, Just dstID) ->
        case (lookup srcID verticesAssoc, lookup dstID verticesAssoc) of
          (Just vertexSrc, Just vertexDst) -> (vertexSrc, vertexDst)
          _ -> error $ "Fatal: Edge endpoints are not vertices: " ++ show list
      _ -> error $ "Fatal: Edge endpoints not found in attribute list: " ++ show list
    attList :: [[P.Attribute]]
    attList = map (getAttributePairs element) $ resolvePath path hexml
    src = "source"
    dst = "target"

resolvePath:: Path -> HexmlVertex -> [HexmlVertex]
resolvePath [] h = [h]
resolvePath bs h = concatMap (resolvePath (tail bs)) children
  where
    children :: [HexmlVertex]
    children = H.childrenBy h $ head bs

getAttributePairs:: Element -> HexmlVertex -> [P.Attribute]
getAttributePairs e h = map toAttribute $  mapMaybe (H.attributeBy h) e
  where
    toAttribute :: H.Attribute -> P.Attribute
    toAttribute a = (H.attributeName a, H.attributeValue a)
