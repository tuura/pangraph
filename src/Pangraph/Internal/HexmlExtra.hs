module Pangraph.Internal.HexmlExtra where

import Data.List (concatMap)
import Data.ByteString (ByteString)
import Text.XML.Hexml
import Pangraph

-- * A module containing some exclusivly Hexml helper functions and some which have common interfacing functions.

-- | Find the ['Node'] with the final in the ['ByteString'] after following the
-- 'Node' names recursively.
followChildren :: Node -> [ByteString] -> [Node]
followChildren h [] = [h]
followChildren h bs = (concatMap recurse . childrenBy h) (head bs)
    where
        recurse :: Node -> [Node]
        recurse n = followChildren n (tail bs)

-- An unsafe version of the 'Text.XML.Hexml.parse' upon failure throws error to stderr.
hexmlParse :: ByteString -> Node
hexmlParse file = case parse file of
    Right t -> t
    Left l -> error $ "HexML parser failed:\n" ++ show l 

-- | Converts a between the two libaries Attribute types.
convertAtt :: Text.XML.Hexml.Attribute -> Pangraph.Attribute
convertAtt a = (attributeName a, attributeValue a)
        