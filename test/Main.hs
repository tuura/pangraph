module Main where

import GraphML
import Show
import Containers
import TestPangraph

import Test.HUnit

main :: IO Counts
main = (runTestTT . TestList . concat) [graphmlTests, showTests, containersTests, pangraphTests]
