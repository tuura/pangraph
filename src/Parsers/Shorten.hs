module Parsers.Shorten
(  shortenFile
)where

-- This code is written filter graphml types. But it may repeat itself and not look similar to the equivlent code for other formats.

import Util.Types
import Data.List

-- Just a wrapper to cut through nested types.
shortenFile:: Root -> ShortFile
shortenFile (Root _ t) =ShortFile $ [shortenGraph $ findGraph t]

-- returns the first graph tag to parse its children in shortenGraph
-- recursive
findGraph:: Tag -> Tag
findGraph g@(NodeTag "graph" _ _)=g
findGraph (NodeTag _ _ ts)= head $ map (findGraph) ts

-- finds the graph Tag as by filtering lists. Assumes findGraph is successful.
filterGraphs:: Tag -> Tag
filterGraphs tg@(NodeTag "graph" as ts) = tg
filterGraphs (NodeTag "graphml" as ts) = head $ map filterGraphs ts

-- Cuts out any tag except node and edge removes their attributes except id, source and target
shortenGraph:: Tag -> ShortGraph
shortenGraph (NodeTag _ _ ts) = ShortGraph nsf esf
  where
    (ts2, _) = partition (\(NodeTag str _ _) -> str `elem` ["node" , "edge"]) ts
    (ns, es) = partition (\(NodeTag str _ _) -> str == "node") $ map filterAtt ts2
    -- Casts to different types
    nsf = map (\(NodeTag _ a _) -> (Node a)) ns
    esf = map (\(NodeTag _ a _) -> (Edge a)) es
-- filtering of attributes
filterAtt:: Tag -> Tag
filterAtt (NodeTag str as _) =
  if str == "node" then NodeTag str (filter (\(Att (name, _))-> name == "id") as) []
  else NodeTag str (filter (\(Att (name, _))-> elem name ["id", "target", "source"]) as) []
