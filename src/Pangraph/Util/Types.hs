module Pangraph.Util.Types where

-- Used in parsing files
data Att = Att (String, String) deriving (Show, Eq)
data Tag = NodeTag String [Att] [Tag]
         | StrTag String deriving (Show)
data Root = Root [Att] Tag deriving (Show)

-- Public file types
-- data Att can also go here as it is used in both.
data Node = Node [Att] deriving (Show, Eq)
data Edge = Edge [Att] deriving (Show, Eq)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show, Eq)
data ShortFile = ShortFile [ShortGraph] deriving (Show, Eq)
