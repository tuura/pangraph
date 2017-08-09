module Pangraph.VHDL (
Pangraph.VHDL.writeGraph,
Pangraph.VHDL.writeEnvironment
) where

import Pangraph.VHDL.Internal.EnvironmentWriter as V
import Pangraph.VHDL.Internal.GraphWriter       as V

import Data.ByteString.Char8(pack)
import Data.ByteString(ByteString)
import Pangraph

writeGraph :: Pangraph -> ByteString
writeGraph = pack . V.writeGraph

writeEnvironment :: Pangraph -> ByteString
writeEnvironment = pack . V.writeEnvironment
