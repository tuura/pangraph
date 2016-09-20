module Parsers.Shorten
(  shortenFile
)where

import Util.Types
import Data.List

shortenFile:: Root -> ShortFile
-- shortenFile (Root _ []) =ShortFile ([] :: ShortGraph)
shortenFile (Root _ t) =ShortFile $ [shortenGraph $ findGraph t]

findGraph:: Tag -> Tag
findGraph g@(NodeTag "graph" _ _)=g
findGraph (NodeTag _ _ ts)= head $ map (findGraph) ts
-- findGraph (NodeTag _ _ []) = []

filterGraphs:: Tag -> Tag
filterGraphs tg@(NodeTag "graph" as ts) = tg
filterGraphs (NodeTag "graphml" as ts) = head $ map filterGraphs ts

shortenGraph:: Tag -> ShortGraph
shortenGraph (NodeTag _ _ ts) = ShortGraph nsf esf
  where
    (ts2, _) = partition (\(NodeTag str _ _) -> str `elem` ["node" , "edge"]) ts
    (ns, es) = partition (\(NodeTag str _ _) -> str == "node") $ map filterAtt ts2
    nsf = map (\(NodeTag _ a _) -> (Node a)) ns
    esf = map (\(NodeTag _ a _) -> (Edge a)) es

filterAtt:: Tag -> Tag
filterAtt (NodeTag str as _) =
  if str == "node" then NodeTag str (filter (\(Att (name, _))-> name == "id") as) []
  else NodeTag str (filter (\(Att (name, _))-> elem name ["id", "target", "source"]) as) []
