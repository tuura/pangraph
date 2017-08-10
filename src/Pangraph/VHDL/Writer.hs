module Pangraph.VHDL.Writer (
Pangraph.VHDL.Writer.writeGraph,
Pangraph.VHDL.Writer.writeEnvironment
) where

import Pangraph.VHDL.Internal.EnvironmentWriter as VHDL
import Pangraph.VHDL.Internal.GraphWriter       as VHDL

import Data.ByteString.Char8(pack)
import Data.ByteString(ByteString)
import Pangraph

-- | A serialiser which will write a graph into a VHDL connections. See more in the Fantasi section.
writeGraph :: Pangraph -> ByteString
writeGraph = pack . VHDL.writeGraph

-- | A serialiser which will write an enviroment VHDL file. See more in the Fantasi section.
writeEnvironment :: Pangraph -> ByteString
writeEnvironment = pack . VHDL.writeEnvironment
