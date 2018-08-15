{-# LANGUAGE OverloadedStrings #-}

module Pangraph.Examples.SampleGraph
    ( smallGraph
    ) where

import Pangraph
import Data.Either(fromRight)

smallGraph :: Pangraph
smallGraph = fromRight (error "Small graph literal failed to construct.") graph
  where
    graph =
      makePangraph
        [makeVertex "n0" [("id","n0")]
        ,makeVertex "n1" [("id","n1")]
        ,makeVertex "n2" [("id","n2")]]
        [makeEdge ("n0", "n2") 
          [("source","n0"),("target","n2")]]
