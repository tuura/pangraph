{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Examples.SampleGraph
    ( smallGraph
    ) where

import Pangraph

smallGraph :: Pangraph
smallGraph = case graph of
  Just p  -> p
  Nothing -> error "Small graph literal failed to construct."
  where
    graph =
      makePangraph
        [makeVertex "n0" [("id","n0")]
        ,makeVertex "n1" [("id","n1")]
        ,makeVertex "n2" [("id","n2")]]
        [makeEdge [("source","n0"),("target","n2")]
          (makeVertex "n0" [("id","n0")]
          ,makeVertex "n2" [("id","n2")])]
