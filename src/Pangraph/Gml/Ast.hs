{-|
Module          : Pangraph.Gml.Ast
Description     : AST for gml files

AST for gml (Graph Modelling Language) files. The specification of the gml
format can be found: 
<http://www.fim.uni-passau.de/fileadmin/files/lehrstuhl/brandenburg/projekte/gml/gml-technical-report.pdf>.
-}
module Pangraph.Gml.Ast where

-- | Type of a AST node
-- 'k' is the type that is used to represent strings
data Gml k  
    -- | Integer value
    = Integer Integer
    -- | Floating point value
    | Float Double
    -- | String value
    | String k
    -- | Object value. A gml object is a list of named values. The names of the
    -- values are not necessarily unique!
    | Object [(k, Gml k)] deriving (Show, Eq, Ord)

-- | Looks up a value in the given gml object
-- Produces Nothing when the given value is not a gml object or the object 
-- doesn't contain the a value with the given name. If a object contains
-- multiple values with the same name one the values is returned.
lookupValue :: Eq k => Gml k -> k -> Maybe (Gml k)
lookupValue (Object values) key = lookup key values
lookupValue _ _ = Nothing

-- | If the given gml value is a integer produces the integer Value
integerValue :: Gml k -> Maybe Integer
integerValue (Integer v) = Just v
integerValue _ = Nothing

-- | If the given gml value is a double value produces the float value
floatValue :: Gml k -> Maybe Double
floatValue (Float v) = Just v
floatValue _ = Nothing

-- | If the given gml value is a string produces the string value
stringValue :: Gml k -> Maybe k
stringValue (String v) = Just v
stringValue _ = Nothing

-- | If the given gml value is a object produces the list of values that the 
-- object contains
objectValues :: Gml k -> Maybe [(k, Gml k)]
objectValues (Object values) = Just values
objectValues _  = Nothing

-- | Maps all strings in the gml ast.
mapStrings :: (a -> b) -> Gml a -> Gml b
mapStrings f (Object attrs) = (Object 
    (map (\(k, v) -> (f k, mapStrings f v)) attrs))
mapStrings f (String s) = (String (f s))
mapStrings _  (Integer i) = (Integer i)
mapStrings _ (Float f) = (Float f)
