module Tuura.Fantasi.Main (main) where

import Tuura.Fantasi.Options
import qualified Pangraph.GraphML.Parser as P
import qualified Pangraph.VHDL.EnvironmentWriter as W1
import qualified Pangraph.VHDL.GraphWriter as W2
import Data.ByteString.Char8 (pack)

main :: IO ()
main = do
    -- get arguments
    options <- getOptions
    let graphMLPath           = optGraphML options
        graphVHDLPath         = optGraphName options
        simulationEnvVhdlPath = optSimName options

    -- parse graph
    let pangraph = P.unsafeParse (pack graphMLPath)
    let graphVHDL   = W2.writeGraphVhdl pangraph
    let simEnvVHDL  = W1.writeEnvironmentVhdl pangraph

    -- output vhdl graph
    writeFile graphVHDLPath graphVHDL
    -- output vhdl simulation environment
    writeFile simulationEnvVhdlPath simEnvVHDL
