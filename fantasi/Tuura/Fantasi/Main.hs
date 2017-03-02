module Tuura.Fantasi.Main (main) where

import Control.Monad
import System.FilePath

import Tuura.Fantasi.Options
import qualified Pangraph.Parser as P
import qualified Pangraph.Writer as W

main :: IO ()
main = do
    -- get arguments
    options <- getOptions
    let graphMLPath           = optGraphML options
        graphVHDLPath         = optGraphName options
        simulationEnvVhdlPath = optSimName options

    -- parse graph
    graph <- P.readGraph graphMLPath []
    let graphParsed = P.parseGraph graph
        graphVHDL   = W.writeGraphVhdl graphParsed
        simEnvVHDL  = W.writeEnvironmentVhdl $ P.parseGraph graph

    -- output vhdl graph
    writeFile graphVHDLPath graphVHDL
    -- output vhdl simulation environment
    writeFile simulationEnvVhdlPath simEnvVHDL
