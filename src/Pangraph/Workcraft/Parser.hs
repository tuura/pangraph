module Pangraph.Workcraft.Parser
( parseFile
-- , shortenFile
)where

import Text.Parsec
import Data.List
import Data.Either
import Pangraph.Util.Types
import qualified Pangraph.Util.MyXML as M

-- applies the parser and handles parseErrors
parseFile::String -> String -> ShortFile
parseFile file path=either errFunc shortenFile xml
  where
    errFunc _ = error $ show xml
    xml = parse M.parseFile file path

-- finds the graph in the tags, filters out anything not needed, casts to the correct types and returns a ShortFile.
shortenFile::Root -> ShortFile
shortenFile (Root _ t)=ShortFile y
  where
    --Remove any branches not relevant
    --Find the root of the graph
    --Extracting the nodes and edges
    gs = sortTags $ findGraph $ filterGraph t
    -- At this point 'gs' is a list of node and edge
    (ns, es) = partition part' gs
    part' = (\(NodeTag str _ _ ) -> str == "node")
    --Cast each and return the lists.
    nsf = map (\(NodeTag _ as _)-> Node as) ns
    esf = map (\(NodeTag _ as _)-> Edge as) es
    y = [ShortGraph nsf esf]

--Filters the list of tags into edges and nodes.
filterGraph::Tag -> Tag
filterGraph t@(NodeTag n as ts)=NodeTag n as tss
  where
    tss = map filterGraph $ filter isRelevant ts

--Returns the list of children of the graph root
findGraph::Tag -> Tag
findGraph t@(NodeTag "root" _ ts) = t
findGraph (NodeTag _ _ ts) = head $ map findGraph ts

--filters attributes and extracts them from their Types
sortTags::Tag -> [Tag]
sortTags (NodeTag n as ts)=map adaptTag ts

-- Renames all the attributes and Tag names to allow some code to be reused.
-- but it must get infomation from a tag and the child so a few helper functions are called.
adaptTag::Tag -> Tag
adaptTag t@(NodeTag n as ts)=NodeTag nn asn []
  where
    ts' =NodeTag nn asn []
    nn = translate.getChildName $ head ts
    as' = filter (\(Att (a, _))-> a == "ref") as
    as'' = getChildAtt $ head ts
    asn = renameAtt $ as' ++ as''

renameAtt::[Att] -> [Att]
renameAtt as=map (\(Att (a,b))-> Att (translate a, b)) as

-- filters the attributes to be added to a different type.
getChildAtt::Tag -> [Att]
getChildAtt (NodeTag _ as _)=filter'
  where
    filter' =filter myBool' as
    myBool' =(\(Att (a,_))-> (translate a) `elem` allowedAtt)
    allowedAtt = ["source", "target"]

getChildName::Tag -> String
getChildName (NodeTag str _ _) = str
getChildName (StrTag str )= str

--The following functions are intended to generalize the creation of this module.
isRoot:: Tag -> Bool
isRoot (NodeTag str _ _)= str == "root"
isRoot (StrTag _)=False

-- Whether any of its chidren will contain needed infomation
isRelevant:: Tag -> Bool
isRelevant (NodeTag str _ _)= str `elem` ["model", "node", "root", "MathConnection", "Vertex"]
isRelevant (StrTag _)=False

-- Changes all the names to be similar.
translate::String -> String
translate xs
  |xs == "MathConnection" = "edge"
  |xs == "Vertex" = "node"
  |xs == "ref" = "id"
  |xs == "first" = "source"
  |xs == "second" = "target"
  |otherwise = xs
