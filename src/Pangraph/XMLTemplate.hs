module Pangraph.XMLTemplate (
Template,
Name,
Keys,
Text,
root,
name,
keys,
text
) where

import qualified Pangraph as P
import qualified Text.XML.Hexml as H
import qualified Data.ByteString as BS

data Template = XML Name Keys Text [Template]
type Name = BS.ByteString
type Keys = [BS.ByteString]
type Text = Bool

root::Name -> Keys -> Text -> Template
root n ks t= XML n ks t []

name:: BS.ByteString -> Name
name n= n

keys::[BS.ByteString] -> Keys
keys ks= ks

text:: Bool -> Text
text bl =bl

-- To write code to implement parsing of a template.
parseFromTemplate:: H.Node -> Template -> P.Pangraph
parseFromTemplate=undefined
