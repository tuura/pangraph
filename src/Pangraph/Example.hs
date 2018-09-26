module Pangraph.Example where
    
import Pangraph.Examples.SampleGraph(smallGraph)

import qualified Pangraph.GraphML.Parser as GraphML
import qualified Pangraph.GraphML.Writer as GraphML

import qualified Pangraph.Gml.Parser as Gml
import qualified Pangraph.Gml.Writer as Gml

import qualified Pangraph.Containers as Containers

import qualified Pangraph.Workcraft.Parser as Workcraft

import qualified Data.ByteString as BS 

main :: IO ()
main = do 
    workcraftXML <- BS.readFile "./examples/graphs/model.xml"
    print $ Workcraft.parse workcraftXML
    
    -- Serialise and re-parse the graph in to GraphML.
    let Just gGraphML = (GraphML.parse . GraphML.write) smallGraph
    -- Test equality
    print $ "GraphML reflectivity: " ++ show (gGraphML == smallGraph)
    
    -- Serialise and re-parse the graph into Gml
    let Just gGml = (Gml.parse . Gml.write) smallGraph
    print $ "Gml reflectivity: " ++ show (gGml == smallGraph)
    -- Print the result of the Containers conversion
    print $ ((\(a,_,_) -> a) . Containers.convert) smallGraph
