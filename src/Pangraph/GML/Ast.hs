module Pangraph.GML.Ast where

data GML k = Integer Integer
    | Float Double
    | String k
    | Object [(k, GML k)] deriving (Show, Eq, Ord)

lookupValue :: Eq k => GML k -> k -> Maybe (GML k)
lookupValue (Object values) key = lookup key values
lookupValue _ _ = Nothing

integerValue :: GML k -> Maybe Integer
integerValue (Integer v) = Just v
integerValue _ = Nothing

floatValue :: GML k -> Maybe Double
floatValue (Float v) = Just v
floatValue _ = Nothing

stringValue :: GML k -> Maybe k
stringValue (String v) = Just v
stringValue _ = Nothing

objectValues :: GML k -> Maybe [(k, GML k)]
objectValues (Object values) = Just values
objectValues _  = Nothing

mapStrings :: (a -> b) -> GML a -> GML b
mapStrings f (Object attrs) = (Object 
    (map (\(k, v) -> (f k, mapStrings f v)) attrs))
mapStrings f (String s) = (String (f s))
mapStrings _  (Integer i) = (Integer i)
mapStrings _ (Float f) = (Float f)
