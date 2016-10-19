module Pangraph.GraphML.Writer
( writeGraph
) where

import qualified Pangraph.Util.FileHandler as F
import Pangraph.Util.Types

-- Calls other functions here to create text.

--The version is for relative paths in current dir.
writeGraph::FilePath -> ShortFile -> IO ()
writeGraph path graph=F.writeHandler path $ createText graph

-- Unwrapper for Shortfile Type
createText::ShortFile -> String
createText (ShortFile gs)=createText' $ head gs

-- Adds strings from lsits with and functions and adds relavant identation by partially applying functions.
createText'::ShortGraph -> String
createText' (ShortGraph ns es)=(concat strings) ++ closingTags
  where
    strings = [writeHeader 0, writeGraphML 0, writeGraphTag 1, nodes, edges]
    -- indent = [0,0,1,2,2]
    edges = concat $ map (writeEdge 2) $ es
    nodes = concat $ map (writeNode 2) $ ns
    closingTags = getIndent 1 ++ "</graph>\n" ++ "</graphml>"

-- All of these return strings, the are called partially applied with the indentation from createText'.
writeHeader::Int -> String
writeHeader n="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"

writeGraphML::Int -> String
writeGraphML n="<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n"

writeGraphTag::Int ->String
writeGraphTag n =(getIndent n) ++ "<graph id=\"G\" edgedefault=\"undirected\">\n"

writeNode::Int -> Node -> String
writeNode n (Node as)=(getIndent n) ++ "<node" ++ (concat $ map writeAtt as) ++ "/>\n"

writeEdge::Int -> Edge -> String
writeEdge n (Edge as)=(getIndent n) ++ "<edge" ++ (concat $ map writeAtt as) ++ "/>\n"

writeAtt::Att -> String
writeAtt (Att (a,b))= " " ++ a ++ "=\"" ++ b ++ "\""

--where n is the level of indentation.
getIndent::Int -> String
getIndent n = take (2*n) $ repeat ' '
