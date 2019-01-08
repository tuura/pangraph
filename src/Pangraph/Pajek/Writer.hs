{-# LANGUAGE OverloadedStrings #-}
{-|
Module          : Pangraph.Pajek.Writer
Description     : Write pajek (.net) files

Functions for writeing pajek files.
Roughly follows the specification <https://gephi.org/users/supported-graph-formats/pajek-net-format/>
-}
module Pangraph.Pajek.Writer (write, pangraphToPajek, writePajek) where

import Data.Maybe
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Builder
import qualified Data.ByteString.Lazy as L
import Data.Monoid
import Prelude hiding (concat, (++))

import qualified Pangraph as P
import Pangraph.Pajek.Ast

-- | Writes a 'Pangraph' into a bytestring.
-- | Since there is no way of knowing weather a edge is directed or undirected
-- | in a 'Pangraph' all edges are written as directed edges.
write :: P.Pangraph -> ByteString
write = writePajek . pangraphToPajek

-- | Converts a 'Pangraph' into a 'Pajek' graph.
pangraphToPajek :: P.Pangraph -> Pajek ByteString
pangraphToPajek graph = let
  pEdges = P.edgeList graph
  pVertices = P.vertexList graph
  in Graph Nothing (map vertexToPajek pVertices) (map edgeToPajek pEdges)

vertexToPajek :: P.Vertex -> Vertex ByteString
vertexToPajek vertex = let
  label' = fmap snd $ listToMaybe $ filter ((== "label") . fst)
    (P.vertexAttributes vertex)
  vId = read $ BC.unpack $ P.vertexID vertex
  in (vId, label')

edgeToPajek :: P.Edge -> Edge
edgeToPajek edge = let
  weight' = fmap (read . BC.unpack . snd) $ listToMaybe $ filter ((== "weight") . fst)
    (P.edgeAttributes edge)
  (source', target') = P.edgeEndpoints edge
  source = read $ BC.unpack source'
  target = read $ BC.unpack target'
  in maybe (Unweighted False source target) (\w -> Weighted False source target w) weight'

vertexLine :: Vertex ByteString -> Builder
vertexLine vertex = let
    vId = show $ vertexId vertex
    label' = maybe (stringUtf8 "")
        (\s -> charUtf8 '\"' <> byteString s <> charUtf8 '\"') (label vertex)
    in stringUtf8 vId <> charUtf8 ' ' <> label'

edgeLine :: Edge -> Builder
edgeLine edge = let
    (source, target) = endpoints edge
    weight' = maybe (stringUtf8 "")
        (\w -> charUtf8 ' ' <> stringUtf8 (show w)) (weight edge)
    in stringUtf8 (show source) <> charUtf8 ' ' <> stringUtf8 (show target)
        <> weight'

pajekBuilder :: Pajek ByteString -> Builder
pajekBuilder pajek = do
  let vertexCount = length (vertices pajek)
  let edgeCount = length (edges pajek)
  stringUtf8 "*Vertices " <> stringUtf8 (show vertexCount) <> charUtf8 '\n'
    <> mconcat [vertexLine v <> charUtf8 '\n' | v <- vertices pajek]
    <> "*Arcs " <> stringUtf8 (show edgeCount) <> charUtf8 '\n'
    <> mconcat [edgeLine e <> charUtf8 '\n' | e <- edges pajek]

-- | Writes a 'Pajek' into a 'ByteString'
writePajek :: Pajek ByteString -> ByteString
writePajek pajek = L.toStrict (toLazyByteString (pajekBuilder pajek))
