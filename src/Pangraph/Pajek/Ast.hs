module Pangraph.Pajek.Ast where
{-|
Module          : Pangraph.Pajek.Ast
Description     : Abstract syntax tree for pajek (.net) files
-}
data Pajek a = Graph (Maybe a) [Vertex a] [Edge] deriving (Show, Eq, Ord)

type Vertex a = (Integer, Maybe a)
data Edge = Unweighted Bool Integer Integer
  | Weighted Bool Integer Integer Double deriving (Show, Eq, Ord)

name :: Pajek a -> Maybe a
name (Graph n _ _) = n

vertices :: Pajek a -> [Vertex a]
vertices (Graph _ vs _) = vs

edges :: Pajek a -> [Edge]
edges (Graph _ _ ed) = ed

label :: Vertex a -> Maybe a
label (_, l) = l

vertexId :: Vertex a -> Integer
vertexId (i, _) = i

endpoints :: Edge -> (Integer, Integer)
endpoints (Unweighted _ n1 n2) = (n1, n2)
endpoints (Weighted _ n1 n2 _) = (n1, n2)

weight :: Edge -> Maybe Double
weight (Unweighted _ _ _) = Nothing
weight (Weighted _ _ _ w) = Just w

directed :: Edge -> Bool
directed (Unweighted d _ _) = d
directed (Weighted d _ _ _) = d
