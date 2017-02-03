module Pangraph
(

) where

data Graph = Graph [Node ::Node] [Arc ::Arc]
data Attribute = Node [ByteString]
                | Arc [ByteString]
