module Util.Types
(  Att(..)
,  Tag(..)
,  Root(..)
,  Node(..)
,  Edge(..)
,  ShortGraph(..)
,  ShortFile(..)
)where

-- type Attribute = Att

data Att = Att (String, String) deriving (Show, Eq)
data Tag = NodeTag String [Att] [Tag]
         | StrTag String deriving (Show)
data Root = Root [Att] Tag deriving (Show)

data Node = Node [Att] deriving (Show, Eq)
data Edge = Edge [Att] deriving (Show, Eq)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show, Eq)
data ShortFile = ShortFile [ShortGraph] deriving (Show, Eq)
