{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.Graph (
-- Abstract Types
Pangraph,
Vertex,
Edge,
Attribute, -- A type alias for (Key, Value)
Key,
Value,

-- Constructors
makePangraph,
makeVertex,
makeEdge,
makeKey,
makeValue,
-- Getters
vertices,
edges,
vertexAttributes,
edgeAttributes,
edgeEndpoints,
key,
value,
) where

import Data.List (intercalate)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict                  as Map
import qualified Data.ByteString                  as BS

data Pangraph = Pangraph
  { vertices' :: Map Identifier Vertex
  , edges' :: Map Identifier Edge
  } deriving (Eq)
data Vertex = Vertex
  { vertexID' :: Maybe Identifier
  , vertexAttributes' :: [Attribute]
  } deriving (Eq)
data Edge = Edge
  { edgeID' :: Maybe Identifier
  , edgeAttributes' :: [Attribute]
  , source :: Vertex
  , target :: Vertex
  } deriving (Eq)

type Identifier = Word
type Attribute = (Key, Value)

newtype Key = Key BS.ByteString deriving (Eq, Ord, Show)
newtype Value = Value BS.ByteString deriving (Eq, Ord, Show)


-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Pangraph
makePangraph vs es = Pangraph (Map.fromList indexVertices) (Map.fromList indexEdges)
  where
    indexVertices :: [(Identifier, Vertex)]
    indexVertices = map (\ (i, (Vertex _ as)) -> (i, (Vertex (Just i) as))) $ zip indexList vs
    indexEdges :: [(Identifier, Edge)]
    indexEdges = map (\ (i, (Edge _ as a b)) -> (i, (Edge (Just i) as a b ))) $ zip indexList es
    indexList :: [Identifier]
    indexList = [0..] :: [Identifier]

makeVertex :: [Attribute] -> Vertex
makeVertex = Vertex Nothing

makeEdge :: [Attribute] -> Vertex -> Vertex -> Edge
makeEdge = Edge Nothing

-- Other Constructors

makeKey :: BS.ByteString -> Key
makeKey = Key

makeValue :: BS.ByteString -> Value
makeValue = Value

-- makeAttribute :: (Key, Value) -> Attribute
-- makeAttribute a = Attribute a

-- Getters

vertices :: Pangraph -> [Vertex]
vertices p = map snd $ Map.toList $ vertices' p

edges :: Pangraph -> [Edge]
edges p = map snd $ Map.toList $ edges' p

key :: Key -> BS.ByteString
key (Key a) = a

value :: Value -> BS.ByteString
value (Value a) = a

--  Accessor methods

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

-- Primitive fields

-- vertexID :: Vertex -> Identifier
-- vertexID node =
--   case vertexID' node of
--     Just a -> a
--     Nothing -> error $ "Fatal: Vertex missing ID, " ++ show node
--
-- edgeID :: Edge -> Identifier
-- edgeID edge =
--   case edgeID' edge of
--     Just a -> a
--     Nothing -> error $ "Fatal: Edge missing ID, " ++ show edge

edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints e = (source e, target e)

instance Show Pangraph where
  show (Pangraph n e) = "Pangraph " ++ show (Map.toList n) ++ " "  ++ show (Map.toList e)

instance Show Vertex where
  show (Vertex _ as) = "Vertex " ++ show as

instance Show Edge where
  show (Edge _ as src dst) = intercalate " " ["Edge", show as, show $ vertexID' src , show $ vertexID' dst ]
