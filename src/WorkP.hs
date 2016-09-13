module WorkP
( parseFile
, shortenFile
)where

import Text.Parsec
import Types
import Data.List
import Data.Either
import qualified MyXML as M

parseFile::String -> String -> ShortFile
parseFile file path=either errFunc shortenFile xml
  where
    errFunc _ = ShortFile []
    xml = parse M.parseFile path file

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
-- filterGraph t@(NodeTag "node" _ _)=t
filterGraph t@(NodeTag n as ts)=NodeTag n as tss
  where
    tss = map filterGraph $ filter isRel ts

--Returns the list of children of the graph root
findGraph::Tag -> Tag
findGraph t@(NodeTag "root" _ ts) = t
findGraph (NodeTag _ _ ts) = head $ map findGraph ts

--filters attributes and extracts them from their Types
sortTags::Tag -> [Tag]
sortTags (NodeTag n as ts)=map adaptTag ts

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

getChildAtt::Tag -> [Att]
getChildAtt (StrTag str ) = [Att(str,"WWWWWWWWW")]
getChildAtt (NodeTag _ as _)=filter'
  where
    filter' =filter myBool' as
    myBool' =(\(Att (a,_))-> (translate a) `elem` allowedAtt)
    allowedAtt = ["source", "target"]

getChildName::Tag -> String
getChildName (NodeTag str _ _) = str
getChildName (StrTag str )= str

--The following functions are intended to generalize
--the creating of this module.
isRoot:: Tag -> Bool
isRoot (NodeTag str _ _)= str == "root"
isRoot (StrTag _)=False

isRel:: Tag -> Bool
isRel (NodeTag str _ _)= str `elem` ["model", "node", "root", "MathConnection", "Vertex"]
isRel (StrTag _)=False

translate::String -> String
translate xs
  |xs == "MathConnection" = "edge"
  |xs == "Vertex" = "node"
  |xs == "ref" = "id"
  |xs == "first" = "source"
  |xs == "second" = "target"
  |otherwise = xs
