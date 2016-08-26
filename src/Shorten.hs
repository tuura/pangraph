module Shorten
(  shortenFile
)where

import Gmlp
import Types
import Data.List

shortenFile:: File -> ShortFile
shortenFile (File _ _ []) = ShortFile []
shortenFile (File _ _ ts) =ShortFile $ map (shortenGraph) (map filterGraphs $ filter isGraph ts)
  where isGraph (Tag str _ _)=str `elem` ["graph", "graphml"]
  
filterGraphs:: Tag -> Tag
filterGraphs tg@(Tag "graph" as ts) = tg
filterGraphs (Tag "graphml" as ts) = head $ map filterGraphs ts

shortenGraph:: Tag -> ShortGraph
shortenGraph (Tag _ _ ts) = ShortGraph nsf esf
  where
    (ts2, _) = partition (\(Tag str _ _) -> str `elem` ["node" , "edge"]) ts
    (ns, es) = partition (\(Tag str _ _) -> str == "node") $ map filterAtt ts2
    nsf = map (\(Tag _ a _) -> (Node a)) ns
    esf = map (\(Tag _ a _) -> (Edge a)) es

filterAtt:: Tag -> Tag
filterAtt (Tag str as _) =
  if str == "node" then Tag str (filter (\(Attribute (name, _))-> name == "id") as) []
  else Tag str (filter (\(Attribute (name, _))-> elem name ["id", "target", "source"]) as) []
