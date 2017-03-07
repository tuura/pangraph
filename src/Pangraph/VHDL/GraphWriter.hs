module Pangraph.VHDL.GraphWriter
( writeGraphVhdl )where

import Data.List
import Pangraph.Util.Types

type NodeName  = String
type NodeIndex = Int

writeGraphVhdl :: ShortFile -> String
writeGraphVhdl (ShortFile (g:gs)) = do
    let stats       = "-- Nodes: " ++ show (nodeCount g) ++ " - Edges: " ++ show (edgeCount g) ++ "\n"
        library     = createLibrary
        entity      = createEntity (getNodes g)
        archOpen    = openArchitecture g
        regs        = "\t-- Registers\n" ++ bindRegisters (getNodes g) 0
        wiresIn     = "\t-- Wire connections: inputs\n" ++ bindWiresIn g
        wiresOut    = "\t-- Wire connections: outputs\n" ++ bindWiresOut ((length (getNodes g)) -1)
        archClose   = closeArchitecture
    stats ++ library ++ entity ++ archOpen ++ regs ++ wiresIn ++ wiresOut ++ archClose

createLibrary :: String
createLibrary =     "-- File generated automatically\n"
                ++  "LIBRARY ieee;\n"
                ++  "USE ieee.std_logic_1164.all;\n\n"
                ++  "LIBRARY work;\n\n"

createEntity :: [Node] -> String
createEntity ns =   "ENTITY Graph IS\n"
                 ++ "\tPORT (\n"
                 ++ "\t\tCLK\t: IN\tstd_logic;\n"
                 ++ "\t\tRST\t: IN\tstd_logic;\n"
                 ++ "\t\tEN\t: IN\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                 ++ "\t\tDIN\t: IN\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                 ++ "\t\tDOUT\t: OUT\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0));\n"
                 ++ "END Graph;\n\n"
                 where
                     nNodes = length ns

openArchitecture :: ShortGraph -> String
openArchitecture (ShortGraph ns es) = do
    let open     = "ARCHITECTURE Graph_circuit OF Graph IS\n\n"
        register = createRegister
        sigs     = createSignals ns
        begin    = "BEGIN\n\n"
    open ++ register ++ sigs ++ begin

closeArchitecture :: String
closeArchitecture = "\nEND Graph_circuit;"

bindWiresIn :: ShortGraph -> String
bindWiresIn (ShortGraph ns es) = getStructure ns ns es

bindWiresOut :: Int -> String
bindWiresOut 0 =   "\tDOUT(0) <= data_out(0);\n"
bindWiresOut n =   "\tDOUT(" ++ show n ++ ") <= data_out(" ++ show n ++ ");\n"
                ++ bindWiresOut (n-1)

getStructure :: [Node] -> [Node] -> [Edge] -> String
getStructure []     _     es =   "\n"
getStructure (n:ns) nodes es =   "\tdata_in(" ++ show i ++ ") <=\tDIN(" ++ show i ++ ")"
                          ++ getInput (getConnections (getName n) nodes es)
                          ++ getStructure ns nodes es
                          where
                              i = getIndex (getName n) nodes 0

getInput :: [NodeIndex] -> String
getInput []     = ";\n"
getInput (ni:nis) = "\n\t\t\tOR data_out(" ++ show ni ++ ")" ++ getInput nis

createRegister :: String
createRegister =   "\tCOMPONENT ffd IS\n"
                ++ "\t\tPORT (\n"
                ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
                ++ "\t\t\tRST\t: IN\tstd_logic;\n"
                ++ "\t\t\tEN\t: IN\tstd_logic;\n"
                ++ "\t\t\tD\t: IN\tstd_logic;\n"
                ++ "\t\t\tQ\t: OUT\tstd_logic\n"
                ++ "\t\t);\n"
                ++ "\tEND COMPONENT;\n\n"

createRegisterGeneric :: Int -> String
createRegisterGeneric n =   "\tCOMPONENT Register_gen IS\n"
                         ++ "\t\tgeneric (N : integer := " ++ show n ++ ");\n"
                         ++ "\t\tPORT (\n"
                         ++ "\t\t\tCLK\t\t: IN\tstd_logic;\n"
                         ++ "\t\t\tRST\t\t: IN\tstd_logic;\n"
                         ++ "\t\t\tEN\t\t: IN\tstd_logic;\n"
                         ++ "\t\t\tDATA_IN\t\t: IN\tstd_logic_vector(N-1 downto 0);\n"
                         ++ "\t\t\tDATA_OUT\t: OUT\tstd_logic_vector(N-1 downto 0)\n"
                         ++ "\t\t);\n"
                         ++ "\tEND COMPONENT;\n\n"

createSignals :: [Node] -> String
createSignals ns = do
    let nRegs   = length ns
        sigsIn  = "\tSIGNAL data_in  : STD_LOGIC_VECTOR(" ++ show (nRegs-1) ++ " downto 0);\n"
        sigsOut = "\tSIGNAL data_out : STD_LOGIC_VECTOR(" ++ show (nRegs-1) ++ " downto 0);\n\n"
    sigsIn ++ sigsOut

bindRegisters :: [Node] -> Int -> String
bindRegisters [] _     = "\n"
bindRegisters (n:ns) i = bindRegister (getName n) i ++ bindRegisters ns (i+1)

bindRegister :: NodeName -> Int -> String
bindRegister name i =    "\tREG_" ++ name ++ " : ffd PORT MAP (\n"
                      ++ "\t\tCLK\t=>\tCLK,\n"
                      ++ "\t\tRST\t=>\tRST,\n"
                      ++ "\t\tEN\t=>\tEN(" ++ show i ++ "),\n"
                      ++ "\t\tD\t=>\tdata_in(" ++ show i ++ "),\n"
                      ++ "\t\tQ\t=>\tdata_out(" ++ show i ++ "));\n"

getName :: Node -> String
getName (Node ((Att (_, name)):_)) = name

getNodes :: ShortGraph -> [Node]
getNodes (ShortGraph ns _) = ns

nodeCount :: ShortGraph -> Int
nodeCount (ShortGraph ns _) = length ns

getEdges :: ShortGraph -> [Edge]
getEdges (ShortGraph _ es) = es

edgeCount :: ShortGraph -> Int
edgeCount (ShortGraph _ es) = length es

getIndex :: NodeName -> [Node] -> Int -> NodeIndex
getIndex nn [] _ = error $ "Node " ++ nn ++ " is not present in the graph"
getIndex n1 ((Node (Att (_, n2):as)):ns) i
    | n1 == n2  = i
    | otherwise = getIndex n1 ns (i+1)

getConnections :: NodeName -> [Node] -> [Edge] -> [NodeIndex]
getConnections _ _ []         = []
getConnections name ns (Edge (Att ("id", _) : Att ("source", source) : Att ("target", target) : as) :es)
    | name == source    = getIndex target ns 0 : getConnections name ns es
    | name == target    = getIndex source ns 0 : getConnections name ns es
    | otherwise         = getConnections name ns es
getConnections name ns (Edge (Att ("source", source) : Att ("target", target) : as) :es)
    | name == source    = getIndex target ns 0 : getConnections name ns es
    | name == target    = getIndex source ns 0 : getConnections name ns es
    | otherwise         = getConnections name ns es
