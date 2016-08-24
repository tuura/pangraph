module Shorten
(  Node(..)
,  Edge(..)
,  ShortGraph(..)
,  ShortFile(..)
,  shortenFile
)where

import Gmlp
import Data.List

data Node = Node [Attribute] deriving (Show)
data Edge = Edge [Attribute] deriving (Show)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show)
data ShortFile = ShortFile [ShortGraph] deriving (Show)

shortenFile:: File -> ShortFile
shortenFile (File _ _ ts) = ShortFile $ map shortenGraph (filter isGraph ts)
  where isGraph (Tag str _ _ ) = (str == "graph")

shortenGraph:: Tag -> ShortGraph
shortenGraph (Tag _ _ ts) = do
  (ns, ts2) <- partition (\(Tag str _ _) -> str == "node") ts
  (as, _) <- partition (\(Tag str _ _) -> str == "edge") ts2
  return ShortGraph $ (shortenNode ns) (shortenEdge as)

shortenNode:: [Tag] -> [Node]
shortenNode ts = map nodeTransform $ ts

nodeTransform:: Tag -> Node
nodeTransform(Tag _ as _) = Node $ (filter (isAllowed ["id"]) as)

shortenEdge:: [Tag] -> [Edge]
shortenEdge ts = map edgeTransform $ ts

edgeTransform:: Tag -> Edge
edgeTransform(Tag _ as _) = Edge $ (filter (isAllowed ["id", "source", "target"]) as)

isAllowed:: [String] -> Attribute -> Bool
isAllowed ss (Attribute name, val) = name `elem` ss
