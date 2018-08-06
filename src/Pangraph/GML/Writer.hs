{-# LANGUAGE OverloadedStrings #-}
module Pangraph.GML.Writer (writeGml, pangraphToGml, write)  where

import Data.ByteString (ByteString, concat)
import Data.ByteString.Char8 (unpack, pack)

import Prelude hiding (concat)

import Pangraph
import Pangraph.GML.Ast

write :: Pangraph -> ByteString
write graph = let
    Just bs = writeGml (pangraphToGml graph)
    in bs

pangraphToGml :: Pangraph -> GML ByteString
pangraphToGml graph = let
    vertices = vertexList graph
    edges = edgeList graph
    gmlVertices = map gmlVertex vertices
    gmlEdges = map gmlEdge edges
    in Object [("graph", Object (gmlVertices ++ gmlEdges))]

gmlVertex :: Vertex -> (ByteString, GML ByteString)
gmlVertex vertex = let
    vId = read (unpack (vertexID vertex))
    filteredAttrs = filter (\(key, _) -> key /= "id") (vertexAttributes vertex)
    attrs = map (\(x, y) -> (x, String y)) (filteredAttrs)
    in ("node", Object (("id", Integer vId):attrs))  

gmlEdge :: Edge -> (ByteString, GML ByteString)
gmlEdge edge = let
    (source, target) = edgeEndpoints edge
    sId = read (unpack (vertexID source))
    tId = read (unpack (vertexID target))
    filteredAttrs = filter (\(key, _) -> not (key `elem` ["source", "target"]))
        (edgeAttributes edge)
    attrs = map (\(x, y) -> (x, String y)) (filteredAttrs)
    in ("edge", Object (("source", Integer sId):("target", Integer tId):attrs))

writeGml :: GML ByteString -> Maybe ByteString
writeGml (Object values) = Just $ concat (
    (map (\(key, value) -> concat [key, " ", writeGml' value]) values))
writeGml _ = Nothing

writeGml' :: GML ByteString -> ByteString
writeGml' (Object values) = concat ( ["["] ++
    (map (\(key, value) -> concat [" ", key, " ", writeGml' value]) values) ++ ["]"])
writeGml' (String s) = concat ["\"", s , "\""]
writeGml' (Float d) = pack (show d)
writeGml' (Integer i) = pack (show i)
