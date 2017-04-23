{-# LANGUAGE OverloadedStrings #-}

module Pangraph.XMLTemplate
( Template,
  graphMLTemplate,
  parseFromTemplate
) where

import Data.Maybe

import qualified Pangraph as P
import qualified Text.XML.Hexml as H

import qualified Data.ByteString as BS

data Template = XML [Node] [Edge]
data Node = Node [(Path, Element)]
data Edge = Edge [(Path, Element)]

type Path = BS.ByteString
type Element = BS.ByteString
type HexmlNode = H.Node


graphMLTemplate:: [Template]
graphMLTemplate=
  [XML
  [Node [("graphml graph node", "id")]]
  [Edge [("graphml graph edge", "source target")]]
  ]

parseFromTemplate:: Template -> HexmlNode -> P.Pangraph
parseFromTemplate (XML nt et) root=P.makePangraph (concat $ map (nodes root) nt) (concat $ map (edges root) et)

nodes:: HexmlNode -> Node -> [P.Node]
nodes n (Node pe) = concat $ map (makeEntity n (P.makeNode)) pe

edges:: HexmlNode -> Edge -> [P.Edge]
edges n (Edge pe) = concat $ map (makeEntity n (P.makeEdge)) pe

makeEntity:: HexmlNode -> ([P.Att] -> a) -> (Path, Element) -> [a]
makeEntity root f a  = fmap f attList
  where
    (hexmlNodes, e) = resolvePath root a
    attList = fmap (\h -> getAttPairs h e) hexmlNodes

resolvePath:: HexmlNode -> (Path, Element) -> ([HexmlNode], Element)
resolvePath h (p, e) =
  let delim = BS.head " "
  in (resolvePathRecursive h $ BS.split delim p, e)

resolvePathRecursive:: HexmlNode -> [Path] -> [HexmlNode]
resolvePathRecursive h [] = [h]
resolvePathRecursive h bs = concat $
  fmap (\c -> resolvePathRecursive c (tail bs)) children
  where
    children = H.childrenBy h $ head bs

getAttPairs:: HexmlNode -> Element -> [P.Att]
getAttPairs h e =fmap toAtt $ catMaybes $ fmap (\a ->H.attributeBy h a) $ BS.split delim e
  where
    delim = BS.head " "
    toAtt:: H.Attribute -> P.Att
    toAtt a = P.makeAtt (H.attributeName a, H.attributeValue a)
