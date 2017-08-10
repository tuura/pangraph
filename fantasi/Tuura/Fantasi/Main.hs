module Tuura.Fantasi.Main (main) where

import Tuura.Fantasi.Options
import qualified Pangraph.GraphML.Parser as P
import qualified Pangraph.VHDL.Writer as VHDL
import Data.ByteString.Char8 (pack, unpack)

main :: IO ()
main = do
    -- get arguments
    options <- getOptions
    let graphMLPath           = optGraphML options
        graphVHDLPath         = optGraphName options
        simulationEnvVhdlPath = optSimName options

    -- parse graph
    let pangraph = P.unsafeParse (pack graphMLPath)
    let graphVHDL   = (unpack . VHDL.writeGraph) pangraph
    let simEnvVHDL  = (unpack . VHDL.writeEnvironment) pangraph

    -- output vhdl graph
    writeFile graphVHDLPath graphVHDL
    -- output vhdl simulation environment
    writeFile simulationEnvVhdlPath simEnvVHDL
