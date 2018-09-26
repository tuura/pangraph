{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Workcraft.Parser (
    parse
) where

import Pangraph
import Pangraph.Internal.ProtoGraph
import Pangraph.Workcraft.Internal

import Data.Maybe (fromJust)

import Data.ByteString(ByteString)

parse :: ByteString -> Maybe Pangraph
parse bs = let
    vf :: ProtoVertex -> VertexID
    vf v = f "ref" (protoVertexAttributes v)
    ef :: ProtoEdge -> (VertexID, VertexID)
    ef e = let
        att = protoEdgeAttributes e
        in (f "first" att, f "second" att)
    f :: ByteString -> [Attribute] -> VertexID
    -- f bs as = fromJust $ lookup bs as
    f a = fromJust . lookup a
    in buildPangraph (hexmlParse bs) vf ef