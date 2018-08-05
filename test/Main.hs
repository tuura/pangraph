module Main where

import GraphML
import Show
import Containers
import TestPangraph
import FGL
import GML

import Test.HUnit

main :: IO Counts
main = (runTestTT . TestList . concat) [containersTests, fglTests, graphmlTests, showTests, pangraphTests, gmlTests]
