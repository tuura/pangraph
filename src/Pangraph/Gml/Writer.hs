{-# LANGUAGE OverloadedStrings #-}
{-|
Module          : Pangraph.Gml.Writer
Description     : Functions for writing gml files

Functions for writing gml files. Follows the gml specification at 
<http://www.fim.uni-passau.de/fileadmin/files/lehrstuhl/brandenburg/projekte/gml/gml-technical-report.pdf>
execpt for two cases:
    
    1. all produced 'ByteString's are encoded in UTF8 instead of ASCII,
    
    2. the line length limit is ignored.
 -}
module Pangraph.Gml.Writer (writeGml, pangraphToGml, write, encodeStrings)  where

import HTMLEntities.Text (text)
import Data.ByteString (ByteString, concat)
import Data.ByteString.Char8 (unpack, pack)
import Data.Text.Encoding (encodeUtf8, decodeUtf8)

import Prelude hiding (concat)

import Pangraph
import Pangraph.Gml.Ast

-- | Serializes a Pangraph into a GML file
write :: Pangraph -> ByteString
write graph = let
    gml = pangraphToGml graph
    Just bs = writeGml gml
    in bs

-- | Converts a 'Pangraph' into a 'Gml' syntax tree.
-- Automatically encodes special characters in strings
pangraphToGml :: Pangraph -> Gml ByteString
pangraphToGml graph = let
    vertices = vertexList graph
    edges = edgeList graph
    gmlVertices = map gmlVertex vertices
    gmlEdges = map gmlEdge edges
    in encodeStrings (Object [("graph", Object (gmlVertices ++ gmlEdges))])

-- | Encodes the string values in a 'Gml' syntax tree
encodeStrings :: Gml ByteString -> Gml ByteString
encodeStrings = mapStrings (encodeUtf8 . text . decodeUtf8)

gmlVertex :: Vertex -> (ByteString, Gml ByteString)
gmlVertex vertex = let
    vId = read (unpack (vertexID vertex))
    filteredAttrs = filter (\(key, _) -> key /= "id") (vertexAttributes vertex)
    attrs = map (\(x, y) -> (x, String y)) (filteredAttrs)
    in ("node", Object (("id", Integer vId):attrs))  

gmlEdge :: Edge -> (ByteString, Gml ByteString)
gmlEdge edge = let
    (source, target) = edgeEndpoints edge
    sId = read (unpack (vertexID source))
    tId = read (unpack (vertexID target))
    filteredAttrs = filter (\(key, _) -> not (key `elem` ["source", "target"]))
        (edgeAttributes edge)
    attrs = map (\(x, y) -> (x, String y)) (filteredAttrs)
    in ("edge", Object (("source", Integer sId):("target", Integer tId):attrs))

-- | Serializes a 'Gml' syntax tree into a bytestring.
-- Produces 'Nothing' for all values except 'Object' since a gml file
-- must contain at least one top level object to hold all values
writeGml :: Gml ByteString -> Maybe ByteString
writeGml (Object values) = Just $ concat (
    (map (\(key, value) -> concat [key, " ", writeGml' value]) values))
writeGml _ = Nothing

writeGml' :: Gml ByteString -> ByteString
writeGml' (Object values) = concat ( ["["] ++
    (map (\(key, value) -> concat [" ", key, " ", writeGml' value]) values) ++ ["]"])
writeGml' (String s) = concat ["\"", s , "\""]
writeGml' (Float d) = pack (show d)
writeGml' (Integer i) = pack (show i)
