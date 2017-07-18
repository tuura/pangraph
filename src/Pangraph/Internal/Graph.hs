{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Internal.Graph (
-- Abstract Types
Pangraph,
Edge,
Vertex,
Attribute, -- A type alias for (Key, Value)
Key,
Value,
Identifier,

-- Constructors
makePangraph,
makeEdge,
makeVertex,
-- makeKey,
-- makeValue,

-- Pangraph Getters
edges,
vertices,
mapEdges,
mapVertices,

-- Getters on Vertex and Edge
edgeAttributes,
edgeEndpoints,
vertexAttributes,
edgeID,
vertexID,

<<<<<<< HEAD
-- Operators
insertVertex,
addEdge,
updateEdge,
lookupVertexValues,
lookupEdgeValues,
vertexByID,
edgeByID,
vertexToAssocList,
edgeToAssocList
=======
-- Getters on Attributes
-- key,
-- value
>>>>>>> parent of 2520073... VHDL working again, most likely the list of nodes it used was reordered in conversion to and from maps. Moved helper functions into the internal module. Added functions like  and
) where

import Data.Map.Strict (Map)
import Data.List (intercalate)
import Data.ByteString.Char8 (pack)
import qualified Data.Map.Strict                  as Map
import qualified Data.ByteString                  as BS

data Pangraph = Pangraph
  { vertices' :: Map Identifier Vertex
  , edges' :: Map Identifier Edge
  } deriving (Eq)
data Vertex = Vertex
  { vertexID' :: Identifier
  , vertexAttributes' :: [Attribute]
  } deriving (Eq)
data Edge = Edge
  { edgeID' :: Maybe Identifier
  , edgeAttributes' :: [Attribute]
  , endpoints' :: (Vertex, Vertex)
  } deriving (Eq)

type Identifier = BS.ByteString
type Attribute = (Key, Value)
type Key = BS.ByteString
type Value = BS.ByteString

-- newtype Key = Key BS.ByteString deriving (Eq, Ord, Show)
-- newtype Value = Value BS.ByteString deriving (Eq, Ord, Show)

-- List based constructors

makePangraph :: [Vertex] -> [Edge] -> Pangraph
makePangraph vs es = Pangraph (Map.fromList indexVertices) (Map.fromList indexEdges)
  where
    indexVertices :: [(Identifier, Vertex)]
    indexVertices = zip (map vertexID vs) vs
    indexEdges :: [(Identifier, Edge)]
    indexEdges = map (\ (i, (Edge _ as a)) -> (i, (Edge (Just i) as a ))) $ zip indexList es
    indexList = (map (pack . show) [0..]) :: [Identifier]

-- The nothing nothing occupies the Identifier field.
makeEdge :: [Attribute] -> (Vertex, Vertex) -> Edge
makeEdge = Edge Nothing

makeVertex :: Identifier -> [Attribute] -> Vertex
makeVertex = Vertex

-- Other Constructors

-- makeKey :: BS.ByteString -> Key
-- makeKey = Key
--
-- makeValue :: BS.ByteString -> Value
-- makeValue = Value

-- Getters

mapEdges :: Pangraph -> Map Identifier Edge
mapEdges p = edges' p

mapVertices :: Pangraph -> Map Identifier Vertex
mapVertices p = vertices' p

edges :: Pangraph -> [Edge]
edges p = map snd $ Map.toList $ edges' p

vertices :: Pangraph -> [Vertex]
vertices p = map snd $ Map.toList $ vertices' p

edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'
edgeID :: Edge -> Identifier

vertexID :: Vertex -> Identifier
vertexID = vertexID'

edgeID edge =
  case edgeID' edge of
    Just a -> a
    Nothing -> error $ "Fatal: Edge missing ID, " ++ show edge

<<<<<<< HEAD
vertexID :: Vertex -> VertexID
vertexID = vertexID'

-- Operations on Pangraph

insertVertex :: Vertex -> Pangraph -> Pangraph
insertVertex v p = Pangraph (newMap) (mapEdges p) (nextEdge' p)
  where
    newMap :: Map VertexID Vertex
    newMap = Map.insert (vertexID v) v (mapVertices p)

updateEdge :: Edge -> Pangraph -> Pangraph
updateEdge e p =
  let newMap = Map.insert (edgeID e) e (mapEdges p)
  in  Pangraph (mapVertices p) newMap (nextEdge' p)

addEdge :: Edge -> Pangraph -> Pangraph
addEdge (Edge (Just _) _ _) _ = error $ "Edge already has an ID, perhaps you should use `updateEdge`"
addEdge (Edge Nothing as a) p =
  Pangraph (mapVertices p) newMap (1 + nextEdge' p)
  where
    newMap :: Map Int Edge
    newMap = Map.insert (edgeID addEdgeID) (addEdgeID) (mapEdges p)
    addEdgeID :: Edge
    addEdgeID = (Edge (Just (nextEdge' p)) as a)

lookupVertexValues :: Vertex -> Key -> Maybe Value
lookupVertexValues v k = lookup k (vertexAttributes v)

lookupEdgeValues :: Edge -> Key -> Maybe Value
lookupEdgeValues e k = lookup k (edgeAttributes e)

vertexByID :: VertexID -> Pangraph -> Maybe Vertex
vertexByID key p = Map.lookup key (mapVertices p)

edgeByID :: EdgeID -> Pangraph -> Maybe Edge
edgeByID key p = Map.lookup key (mapEdges p)

vertexToAssocList :: [Vertex] -> [(VertexID, Vertex)]
vertexToAssocList vs = map (\v -> (vertexID v, v)) vs
=======
edgeEndpoints :: Edge -> (Vertex, Vertex)
edgeEndpoints = endpoints'
>>>>>>> parent of 2520073... VHDL working again, most likely the list of nodes it used was reordered in conversion to and from maps. Moved helper functions into the internal module. Added functions like  and

-- key :: Key -> BS.ByteString
-- key (Key a) = a
--
-- value :: Value -> BS.ByteString
-- value (Value a) = a

instance Show Pangraph where
  show p = "Pangraph " ++ show (vertices p) ++ " " ++ show (edges p)

instance Show Vertex where
  show v@(Vertex _ as) = intercalate " " ["Vertex", show (vertexID v), show as]

instance Show Edge where
  show e@(Edge _ as ends) = intercalate " " ["Edge", show (edgeID e) ,show as] -- show tupleID]
    where
      tupleID :: (Identifier, Identifier)
      tupleID = (vertexID' $ fst ends ,vertexID' $ snd ends)
