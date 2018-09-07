{-|
Module          : Pangraph.GraphML.Writer
Description     : Serlize a `Pangraph` into a `ByteString`

-}

{-# LANGUAGE OverloadedStrings #-}

module Pangraph.GraphML.Writer
( write
) where

import Pangraph
import Prelude hiding(concat)
import Data.ByteString(ByteString, append, concat)
import Data.ByteString.Char8(pack)


-- | Serialise a 'Pangraph' into a GraphML file producing a 'ByteString'.
write :: Pangraph -> ByteString
write p = concat $
    writeHeader  0 :
    writeGraphML 0 :
    writeGraphTag 1 :
    [] ++
    map (writeNode 2) (vertexList p) ++
    map (writeEdge 2) (edgeList p) ++
    [closingTags]

writeHeader :: Int -> ByteString
writeHeader _ = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"

writeGraphML :: Int -> ByteString
writeGraphML _ = "<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" \
  \xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n"

writeGraphTag :: Int -> ByteString
writeGraphTag i = getIndentBS i `append` "<graph id=\"G\" edgedefault=\"undirected\">\n"

writeNode :: Int -> Vertex -> ByteString
writeNode i v = concat [getIndentBS i, "<node", nodesAtts, "/>\n"]
  where
    nodesAtts :: ByteString
    nodesAtts = concat $ map writeAttribute (vertexAttributes v)

writeEdge :: Int -> Edge -> ByteString
writeEdge i e = concat [getIndentBS i, "<edge", edgeAtts, "/>\n"]
  where
    edgeAtts :: ByteString
    edgeAtts = concat $ map writeAttribute (edgeAttributes e)

writeAttribute :: Attribute -> ByteString
writeAttribute (a,b) = concat [" ",  a, "=\"",  b, "\""]

closingTags :: ByteString
closingTags = append (getIndentBS 1) $ append "</graph>\n" "</graphml>"

-- Where i is the level of indentation.
getIndentBS :: Int -> ByteString
getIndentBS i = pack $ replicate (2*i) ' '
