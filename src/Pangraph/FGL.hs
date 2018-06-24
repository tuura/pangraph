module Pangraph.FGL where

import Data.ByteString (ByteString)

import qualified Data.Graph.Inductive.Graph as FGL

import Data.Maybe (fromJust)

import Data.Set (Set)
import qualified Data.Set as Set

import Pangraph

-- | Convert a Pangraph to Fgl types 
convert :: Pangraph -> ([FGL.LNode ByteString], [FGL.LEdge Int])
convert p = 
    let
        -- Create the set of VertexIDs for crossreference when generating FGL.LEdge
        vertexSet :: Set VertexID
        vertexSet = (Set.fromList . map vertexID . vertexList) p
        -- The set of labelled vertices
        fglVertices :: [(Int, VertexID)]
        fglVertices = zip [0..] (Set.toAscList vertexSet)
        -- A helper function for cross referencing a Pangraph Vertex into its order in the set. This index forms a key in FGL.
        findIndexOfVertex :: Vertex -> Int
        findIndexOfVertex v = Set.findIndex (vertexID v) vertexSet 
        -- Find the FGL.Node of the Endpoints, using the Set in VertexID.
        -- Safely cast the edgeID as its emergence from a Pangraph type enforces it must be Just.
        -- The id is formed from the order in the list which are guarrented unique by the pangraph type.
        fglEdges :: [(FGL.Node, FGL.Node, Int)]
        fglEdges = map ((\(e, (a,b)) -> 
            (findIndexOfVertex a, findIndexOfVertex  b, e)) .
            (\e -> ((fromJust . edgeID) e, edgeEndpoints e))) (edgeList p)
        in (fglVertices, fglEdges)
