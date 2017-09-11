module Main where

import GraphML
import Show
import VHDL
import Containers

import Test.HUnit

main :: IO Counts
main = runTestTT $ TestList $ concat [graphmlTests, showTests, vhdlTests, containersTests]
