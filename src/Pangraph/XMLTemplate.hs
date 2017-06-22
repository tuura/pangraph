{-# LANGUAGE OverloadedStrings #-}

module Pangraph.XMLTemplate
( Template,
  graphMLTemplate,
  parseTemplateToAlga,
  parseTemplateToPangraph
) where

import Data.Maybe

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Algebra.Graph.HigherKinded.Class as A

import qualified Data.ByteString as BS

-- A list of places to find nodes and edges.
data Template = XML [Node] [Edge]
-- A list of the locations of tags and which elements to take from them.
data Node = Node [(Path, Element)]
data Edge = Edge [(Path, Element)]

type Path = BS.ByteString
type Element = BS.ByteString
type HexmlNode = H.Node

-- A template for graphML, it extracts the nodes and edges.
graphMLTemplate:: [Template]
graphMLTemplate=
  [XML
  [Node [("graphml graph node", "id")]]
  [Edge [("graphml graph edge", "source target")]]
  ]

parseTemplateToAlga:: (A.Graph g) => Template -> HexmlNode -> g P.Node
parseTemplateToAlga (XML nt et) root=P.makeAlga (concatMap (nodes root) nt) (concatMap (edges root) et)

parseTemplateToPangraph :: Template -> HexmlNode -> P.Pangraph
parseTemplateToPangraph (XML nt et) root = P.makePangraph (concatMap (nodes root) nt) (concatMap (edges root) et)

-- Applies the Node rule to the Hexml root node, returning a list of pangraph nodes found.
nodes:: HexmlNode -> Node -> [P.Node]
nodes n (Node pe) = concatMap (makeEntity n (P.makeNode)) pe

-- Applies the edge rule to the Hexml root edge, returning a list of pangraph edges found.
edges:: HexmlNode -> Edge -> [P.Edge]
edges n (Edge pe) = concatMap (makeEntity n (P.makeEdge)) pe

-- Takes a list of elements
makeEntity:: HexmlNode -> ([P.Attribute] -> a) -> (Path, Element) -> [a]
makeEntity root f a  = fmap f attList
  where
    (hexmlNodes, e) = resolvePath root a
    attList = map (\h -> getAttributePairs h e) hexmlNodes

resolvePath:: HexmlNode -> (Path, Element) -> ([HexmlNode], Element)
resolvePath h (p, e) =
  let delim = BS.head " "
  in (resolvePathRecursive h $ BS.split delim p, e)

resolvePathRecursive:: HexmlNode -> [Path] -> [HexmlNode]
resolvePathRecursive h [] = [h]
resolvePathRecursive h bs = concatMap (\c -> resolvePathRecursive c (tail bs)) children
  where
    children = H.childrenBy h $ head bs

getAttributePairs:: HexmlNode -> Element -> [P.Attribute]
getAttributePairs h e =map toAttribute $ catMaybes $ map (\a ->H.attributeBy h a) $ BS.split delim e
  where
    delim = BS.head " "
    toAttribute:: H.Attribute -> P.Attribute
    toAttribute a = P.makeAttribute (H.attributeName a, H.attributeValue a)
