module Tuura.Fantasi.Main (main) where

import Control.Monad
import System.FilePath

import Tuura.Fantasi.Options
import qualified Pangraph.GraphML.Parser as P
import qualified Pangraph.VHDL.EnvironmentWriter as W1
import qualified Pangraph.VHDL.GraphWriter as W2
import Data.ByteString.Char8 (pack, unpack)

main :: IO ()
main = do
    -- get arguments
    options <- getOptions
    let graphMLPath           = optGraphML options
        graphVHDLPath         = optGraphName options
        simulationEnvVhdlPath = optSimName options

    -- parse graph
    case P.graphmlToPangraph (pack graphMLPath) of
      Left l -> error $ show l
      Right graphParsed -> do
            let graphVHDL   = W2.writeGraphVhdl graphParsed
            let simEnvVHDL  = W1.writeEnvironmentVhdl graphParsed

            -- output vhdl graph
            writeFile graphVHDLPath graphVHDL
            -- output vhdl simulation environment
            writeFile simulationEnvVhdlPath simEnvVHDL
