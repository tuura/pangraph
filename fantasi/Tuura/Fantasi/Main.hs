module Tuura.Fantasi.Main (main) where

import Tuura.Fantasi.Options
import qualified Pangraph.GraphML.Parser  as P
import qualified Pangraph.VHDL.Writer     as VHDL
import Data.ByteString  (readFile, writeFile)
import Prelude hiding   (readFile, writeFile)
import Data.Maybe       (maybe)

main :: IO ()
main = do
    -- get arguments
    options <- getOptions
    let graphMLPath           = optGraphML options
        graphVHDLPath         = optGraphName options
        simulationEnvVhdlPath = optSimName options

    -- parse graph
    pangraph <- ((maybe (error "file or graph is malformed") id) . P.parse) <$> readFile graphMLPath
    let graphVHDL   = VHDL.writeGraph pangraph
    let simEnvVHDL  = VHDL.writeEnvironment pangraph

    -- output vhdl graph
    writeFile graphVHDLPath graphVHDL
    -- output vhdl simulation environment
    writeFile simulationEnvVhdlPath simEnvVHDL
