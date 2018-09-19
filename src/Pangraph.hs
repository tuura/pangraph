{-|
Module          : Pangraph
Description     : Exports the core intermediate type for graph representation.

See `Pangraph` for the type which provides a guaranteed well-formed graph once constructed. The rest of the modules provides constructors and getters on 
this type.
-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Pangraph (
    -- * Abstract Types
    Pangraph, Edge, Vertex, Attribute,
    Key, Value, VertexID, EdgeID, MalformedEdge,

    -- * Constructors
    makePangraph, makeEdge, makeVertex,

    -- * Pangraph Getters
    edgeList, vertexList, lookupVertex, lookupEdge,

    -- * Getters on Vertex and Edge
    edgeAttributes, vertexAttributes,
    edgeEndpoints, edgeID, vertexID

) where

import Data.Maybe            (mapMaybe)
import Data.Map.Strict       (Map)
import qualified Data.Map.Strict  as Map
import qualified Data.ByteString  as BS
import qualified Algebra.Graph.ToGraph as Alga
import qualified Algebra.Graph as Alga

-- | The 'Pangraph' type is the core intermediate type between abstract representations of graphs.
data Pangraph = Pangraph
    { vertices' :: Map VertexID Vertex
    , edges' :: Map EdgeID Edge
    } deriving (Eq)
-- | A Vertex holds ['Attribute'] and must have a unique 'VertexID' to be constructed with 'makeVertex'.
data Vertex = Vertex
    { vertexID' :: VertexID
    , vertexAttributes' :: [Attribute]
    } deriving (Eq)
-- | Edges also reqiure ['Attribute'] and a tuple of 'Vertex' passed as connections to be constructed with 'makeEdge'
data Edge = Edge
    { edgeID' :: Maybe EdgeID
    , endpoints' :: (VertexID, VertexID)
    , edgeAttributes' :: [Attribute]
    } deriving (Eq)

-- | A type exposed for lookup in the resulting lists.
type EdgeID = Int
-- | A field that is Maybe internally is exposed for lookup.
type VertexID = BS.ByteString
-- | The type alias for storage of fields.
type Attribute = (Key, Value)
-- | The 'Key' in the tuple that makes up 'Attribute'.
type Key = BS.ByteString
-- | The 'Value' in the tuple that makes up 'Attribute'.
type Value = BS.ByteString

type MalformedEdge = (Edge, (Maybe VertexID, Maybe VertexID))

instance Show Pangraph where
    show p = "makePangraph " ++ show (Map.elems (vertices' p)) ++ " " ++ show (Map.elems (edges' p))

instance Show Vertex where
    show (Vertex i as) = unwords ["makeVertex", show i, show as]

instance Show Edge where
    show (Edge _ e as) = unwords ["makeEdge", show e, show as]

instance Alga.ToGraph Pangraph where
    type ToVertex Pangraph = VertexID
    toGraph p = Alga.vertices (map vertexID . vertexList $ p) `Alga.overlay` Alga.edges (map edgeEndpoints $ edgeList p)

-- * List based constructors

-- | Takes lists of 'Vertex' and 'Edge' to produce 'Just Pangraph' if the graph is correctly formed.
makePangraph :: [Vertex] -> [Edge] -> Maybe Pangraph
makePangraph vs es = case verifyGraph vertexMap es of
    [] -> (Just . Pangraph vertexMap) edgeMap
    _ -> Nothing
    where
        vertexMap :: Map VertexID Vertex
        vertexMap = Map.fromList $ zip (map vertexID vs) vs
        edgeMap :: Map EdgeID Edge
        edgeMap = Map.fromList indexEdges
        indexEdges :: [(EdgeID, Edge)]
        indexEdges = map (\(i, Edge _ a as) -> (i, Edge (Just i) a as )) $ zip [0..] es

verifyGraph :: Map VertexID Vertex -> [Edge] -> [MalformedEdge]
verifyGraph vs = let
    lookupEndpoints :: (Edge, (VertexID, VertexID)) ->  Maybe MalformedEdge
    lookupEndpoints (e, (v1,v2)) =
        case (Map.lookup v1 vs, Map.lookup v2 vs) of
            (Just _ , Just _)  -> Nothing
            (Nothing, Just _)  -> Just (e, (Just v1, Nothing))
            (Just _ , Nothing) -> Just (e, (Nothing, Just v2))
            (Nothing, Nothing) -> Just (e, (Just v1, Just v2))
    in mapMaybe (\e -> lookupEndpoints (e, edgeEndpoints e))

-- | Edge constructor
makeEdge :: (VertexID, VertexID) -> [Attribute] -> Edge
makeEdge = Edge Nothing

-- | Vertex constructor
makeVertex :: VertexID -> [Attribute] -> Vertex
makeVertex = Vertex

-- * Pangraph Getters

-- | Returns the ['Edge'] from a 'Pangraph' instance
edgeList :: Pangraph -> [Edge]
edgeList p = Map.elems $ edges' p

-- | Returns the ['Vertex'] from a 'Pangraph' instance
vertexList :: Pangraph -> [Vertex]
vertexList p = Map.elems $ vertices' p

-- | Lookup of the 'EdgeID' in a 'Pangraph'. Complexity: /O(log n)/
lookupEdge :: EdgeID -> Pangraph -> Maybe Edge
lookupEdge key p = Map.lookup key $ edges' p

-- | Lookup of the 'VertexID' in a 'Pangraph'. Complexity: /O(log n)/
lookupVertex :: VertexID -> Pangraph -> Maybe Vertex
lookupVertex key p = Map.lookup key $ vertices' p

-- * Getters on 'Edge' and 'Vertex'

-- | Returns the ['Attribute'] of an 'Edge'
edgeAttributes :: Edge -> [Attribute]
edgeAttributes = edgeAttributes'

-- | Returns the ['Attribute'] list of an 'Edge'
vertexAttributes :: Vertex -> [Attribute]
vertexAttributes = vertexAttributes'

-- | Returns the endpoint of tupled 'Vertex' of an 'Edge'
edgeEndpoints :: Edge -> (VertexID, VertexID)
edgeEndpoints = endpoints'

-- | Returns the EdgeID if it has one. 'Edge's are given a new 'EdgeID' when they are passed and retrived from a 'Pangraph'
edgeID :: Edge -> Maybe EdgeID
edgeID = edgeID'

-- | Returns a 'VertexID'
vertexID :: Vertex -> VertexID
vertexID = vertexID'
