module Pangraph.GML.Ast where

import Data.Text (Text)

data GML k = Integer Integer
    | Float Double
    | String Text
    | List [GML k]
    | Object [(k, GML k)] deriving (Show, Eq, Ord)
