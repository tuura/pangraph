module Writers.GmlW
( writeGraph
) where

import System.IO
import Util.Types
import System.Directory

writeGraph::MyFile -> IO ()
-- writeGraph=undefined
writeGraph(MyFile [] fileName graph)=do
  let f = createText graph
  -- putStrLn $ "Writing to: " ++ fileName
  writeFile (tail fileName) f

writeGraph(MyFile dir fileName graph)=do
  dirExsist <- doesDirectoryExist dir
  if not (dirExsist)
    then error $ "directory not found: \n" ++ dir
    else
      do
        let f = createText graph
        -- putStrLn $ "Writing to: "++ dir ++ "@" ++ fileName
        writeFile (dir ++ fileName) f

createText::ShortFile -> String
-- createText=undefined
createText (ShortFile gs)=createText' $ head gs

createText'::ShortGraph -> String
createText' (ShortGraph ns es)=(concat strings) ++ closingTags
  where
    strings = [writeHeader 0, writeGraphML 0, writeGraphTag 1, nodes, edges]
    -- indent = [0,0,1,2,2]
    edges = concat $ map (writeEdge 2) $ es
    nodes = concat $ map (writeNode 2) $ ns
    closingTags = getIndent 1 ++ "</graph>\n" ++ "</graphml>"

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
getIndent n = take (4*n) $ repeat ' '
