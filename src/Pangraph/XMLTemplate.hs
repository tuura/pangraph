module Pangraph.XMLTemplate
-- (  Template
-- -- Name,
-- -- Keys,
-- -- Text,
-- -- root,
-- -- name,
-- -- keys,
-- -- text
-- )
where

import Data.Maybe

import qualified Pangraph as P
import qualified Text.XML.Hexml as H

import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BC

-- import qualified Data.ByteString.Lazy as BS
-- import qualified Data.ByteString.Lazy.Char8 as BC

data Template = XML [Node] [Edge]
data Node = Node [(Path, Element)]
data Edge = Edge [(Path, Element)]

type Path = BS.ByteString
type Element = BS.ByteString
type HexmlNode = H.Node

strToByteString:: String -> BS.ByteString
strToByteString ws = BC.pack ws

graphMLTemplate:: Template
graphMLTemplate=
  XML
  [Node [(strToByteString"graphml graph node",
    strToByteString"id")]]
  [Edge [(strToByteString"graphml graph edge",
    strToByteString"id source target")]]

parseFromTemplate:: Template -> HexmlNode -> P.Pangraph
parseFromTemplate (XML nt et) root=P.makePangraph (concat $ map (nodes root) nt) (concat $ map (edges root) et)

nodes:: HexmlNode -> Node -> [P.Node]
nodes n (Node pe) = concat $ map (makeEntity n (P.makeNode)) pe

edges:: HexmlNode -> Edge -> [P.Edge]
edges n (Edge pe) = concat $ map (makeEntity n (P.makeEdge)) pe

makeEntity:: HexmlNode -> ([P.Att] -> a) -> (Path, Element) -> [a]
makeEntity root f a  = do
  let (nodes, e) = resolvePath root a
  let attList = fmap (\h -> getAttPairs h e) nodes
  return $ fmap f attList

resolvePath:: HexmlNode -> (Path, Element) -> ([HexmlNode], Element)
resolvePath h (p, e) =
  let delim = BS.head $ strToByteString " "
  in (resolvePathRecursive h $ BS.split delim p, e)

resolvePathRecursive:: HexmlNode -> [Path] -> [HexmlNode]
resolvePathRecursive h [] = [h]
resolvePathRecursive h bs = concat $
  fmap (\h -> resolvePathRecursive h (tail bs)) children
  where
    children = H.childrenBy h $ head bs

getAttPairs:: HexmlNode -> Element -> [P.Att]
getAttPairs h e =fmap toAtt $ catMaybes $ fmap (\a ->H.attributeBy h a) $ BS.split delim e
  where
    delim = BS.head $ strToByteString " "
    toAtt:: H.Attribute -> P.Att
    toAtt a = P.makeAtt (H.attributeName a) (H.attributeValue a)
