module Util.Types where
-- (  Att(..)
-- ,  Tag(..)
-- ,  Root(..)
-- ,  Node(..)
-- ,  Edge(..)
-- ,  ShortGraph(..)
-- ,  ShortFile(..)
-- )where

-- type Attribute = Att

--Used in parsing files
data Att = Att (String, String) deriving (Show, Eq)
data Tag = NodeTag String [Att] [Tag]
         | StrTag String deriving (Show)
data Root = Root [Att] Tag deriving (Show)

--Public file types
data Node = Node [Att] deriving (Show, Eq)
data Edge = Edge [Att] deriving (Show, Eq)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show, Eq)
data ShortFile = ShortFile [ShortGraph] deriving (Show, Eq)

--For writing files
type Dir = FilePath
type FileName = FilePath
data MyFile = MyFile Dir FileName ShortFile
