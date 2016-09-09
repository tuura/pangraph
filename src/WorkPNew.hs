module WorkPNew
(  parseFile
,  shortenGraph
) where

import Types
import Data.List

parseFile=undefined

--Takes a root of XML form and returns a ShortGraph
shortenGraph::Root -> ShortGraph
shortenGraph (Root _ t)=do
  (ns, es) <- shortenTag t
  return ShortGraph ns es

--Takes the root tag and starts the recursive search and then filters.
shortenTag::Tag -> ([Node], [Edge])
shortenTag (NodeTag _ _ ts)=do
  t <- findGraphRoot ts
  gs <- getAllTags
  (ns, es) <- partition isNode gs
  nsf <- map (\(NodeTag _ as _)-> Node as) ns
  esf <- map (\(NodeTag _ as _)-> Edge as) es
  return (nsf, esf)
  where isNode (NodeTag n _ _)= n == "node"

--Finds a tag with name "root"
findGraphRoot::[Tag] -> Tag
findGraphRoot=undefined

getAllTags::Tag -> [Tag]
getAllTags=undefined

renameTags::Tag -> Tag
renameTags (NodeTag name as c)=NodeTag (nameDeicder name) (map nameDeicder (fst as)) c

isRootNode::Tag -> Bool
isRootNode (NodeTag name _ _)= name =="root"

isSignificant::Tag -> Bool
isSignificant (NodeTag str _ _)= str == "node"
isSignificant (NodeStr _) = False

nameDeicder:: String -> String
nameDeicder xs
  |xs == "MathConnection" = "edge"
  |xs == "Vertex" = "node"
  |xs == "ref" = "name"
  |otherwise = xs
