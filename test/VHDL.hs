module VHDL (
vhdlTests
) where

import Test.HUnit
import Data.ByteString

import Pangraph
import Pangraph.GraphML.Parser
import Pangraph.VHDL.EnvironmentWriter
import Pangraph.VHDL.GraphWriter
import VHDLLiterals

vhdlTests :: [Test]
vhdlTests = [case1, case2, case3, case4]

case1 :: Test
case1 = TestCase $ assertEqual "case1: Enviroment Writer N1"
  enviroFile1 (writeEnvironmentVhdl $ unsafeParse graphfileN1)

case2 :: Test
case2 = TestCase $ assertEqual "case2: Environment Writer N2"
  enviroFile2 (writeEnvironmentVhdl $ unsafeParse graphfileN2)

case3 :: Test
case3 = TestCase $ assertEqual "case3: Graph Writer N1"
  vhdlGraph1 (writeGraphVhdl $ unsafeParse graphfileN1)

case4 :: Test
case4 = TestCase $ assertEqual "case4: Graph Writer N2"
  vhdlGraph2 (writeGraphVhdl $ unsafeParse graphfileN2)
