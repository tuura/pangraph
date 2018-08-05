module Pangraph.GML.Ast where

import Data.Map as Map
import Data.Text (Text)

data GML = Boolean Bool
    | Integer Integer
    | Float Double
    | String Text
    | List [GML]
    | Object (Map.Map Text GML) deriving (Show, Eq, Ord)
