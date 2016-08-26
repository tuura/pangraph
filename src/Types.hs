module Types
(   Attribute(..)
,   Tag(..)
,   File(..)
,  Node(..)
,  Edge(..)
,  ShortGraph(..)
,  ShortFile(..)
)where

data Attribute = Attribute (String, String) deriving (Show)
data Tag = Tag String [Attribute] [Tag] deriving (Show)
data File= File String [Attribute] [Tag] deriving (Show)

data Node = Node [Attribute] deriving (Show)
data Edge = Edge [Attribute] deriving (Show)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show)
data ShortFile = ShortFile [ShortGraph] deriving (Show)
