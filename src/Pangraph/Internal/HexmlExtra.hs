module Pangraph.Internal.HexmlExtra where

import Data.List (concatMap)
import Data.ByteString (ByteString)
import Text.XML.Hexml
import Pangraph


-- * A module containing containing extra Hexml functions as well as functons to ease conversions between the libraries.

type HexmlAttribute = Text.XML.Hexml.Attribute
type PangraphAttribute = Pangraph.Attribute

-- | Find the ['Node'] with the final name in the ['ByteString'] after following the 'Node' names recursively, including the root node's name.
-- Given `[]` returns '[]'.
followChildren :: Node -> [ByteString] -> [Node]
followChildren _ [] = []
followChildren h bs = if head bs == name h
    then concatMap (`recurse` tail bs) $ childrenBy h (bs !! 1)
    else error $ "Followchildren failed (Did you include the root name?):\n" ++ show h ++ "\n Bytestring: \n" ++ show bs
    where
        recurse :: Node -> [ByteString] -> [Node]
        recurse _ [] = error "Recurse called on empty Bytestring"
        recurse h' [_] = [h']
        recurse h' bs' = concatMap (`recurse` tail bs') $ childrenBy h' (bs' !! 1)

-- An unsafe version of the 'Text.XML.Hexml.parse' upon failure throws error to stderr, showing the resulting error message.
hexmlParse :: ByteString -> Node
hexmlParse file = case parse file of
    Right t -> t
    Left l -> error $ "HexML parser failed:\n" ++ show l 

-- | Converts a between the two libaries Attribute types.
convertAtt :: HexmlAttribute -> PangraphAttribute
convertAtt a = (attributeName a, attributeValue a)

-- | Extend `H.attributeBy` to lists.
attributesBy :: [ByteString] -> Node -> [Maybe HexmlAttribute]
attributesBy bs h = map (attributeBy h) bs

-- | Traverse the Hexml node tree using `followChildren` apply a filter to its results and apply a function to the remaining nodes.
-- The resulting `Node`s are then filtered and have a function applied.
-- The function `(Node -> a)` may then return the data from this node or its children. 
followChildrenFilterThenApplyFunction 
    :: Node 
    -> [ByteString]
    -> (Node -> Bool) 
    -> (Node -> a) 
    -> [a]
followChildrenFilterThenApplyFunction
    root nodePath filterPredicate callerFunc = 
        ( map callerFunc 
        . filter filterPredicate 
        . followChildren root
        ) nodePath
