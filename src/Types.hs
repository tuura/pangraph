module Types
(  Att(..)
,  Tag(..)
,  Root(..)
,  Node(..)
,  Edge(..)
,  ShortGraph(..)
,  ShortFile(..)
)where

type Attribute = Att

data Att = Att (String, String) deriving (Show)
data Tag = NodeTag String [Att] [Tag]
         | StrTag String deriving (Show)
data Root = Root [Att] Tag deriving (Show)

data Node = Node [Attribute] deriving (Show)
data Edge = Edge [Attribute] deriving (Show)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show)
data ShortFile = ShortFile [ShortGraph] deriving (Show)
