{-# LANGUAGE OverloadedStrings #-}

module Pangraph.VHDL.GraphWriter (
writeGraphVhdl
) where

import qualified Pangraph         as P
import qualified Data.ByteString as BS
import Data.ByteString.Char8 (unpack)


type NodeName  = String
type NodeIndex = Int

writeGraphVhdl :: P.Pangraph -> String
writeGraphVhdl g = do
    let stats       = "-- Nodes: " ++ show (length $ P.nodes g) ++ " - Edges: " ++ show (length $ P.edges g) ++ "\n"
        library     = createLibrary
        entity      = createEntity (P.nodes g)
        archOpen    = openArchitecture g
        regs        = "\t-- Registers\n" ++ bindRegisters (P.nodes g) 0
        wiresIn     = "\t-- Wire connections: inputs\n" ++ bindWiresIn g
        wiresOut    = "\t-- Wire connections: outputs\n" ++ bindWiresOut ((length (P.nodes g)) -1)
        archClose   = closeArchitecture
    stats ++ library ++ entity ++ archOpen ++ regs ++ wiresIn ++ wiresOut ++ archClose

createLibrary :: String
createLibrary =     "-- File generated automatically\n"
                ++  "LIBRARY ieee;\n"
                ++  "USE ieee.std_logic_1164.all;\n\n"
                ++  "LIBRARY work;\n\n"

createEntity :: [P.Node] -> String
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

openArchitecture :: P.Pangraph -> String
openArchitecture p = do
    let open     = "ARCHITECTURE Graph_circuit OF Graph IS\n\n"
        register = createRegister
        sigs     = createSignals ns
        begin    = "BEGIN\n\n"
    open ++ register ++ sigs ++ begin
    where
      ns = P.nodes p

closeArchitecture :: String
closeArchitecture = "\nEND Graph_circuit;"

bindWiresIn :: P.Pangraph -> String
bindWiresIn p = getStructure (P.nodes p) (P.nodes p) (P.edges p)

bindWiresOut :: Int -> String
bindWiresOut 0 =   "\tDOUT(0) <= data_out(0);\n"
bindWiresOut n =   "\tDOUT(" ++ show n ++ ") <= data_out(" ++ show n ++ ");\n"
                ++ bindWiresOut (n-1)

getStructure :: [P.Node] -> [P.Node] -> [P.Edge] -> String
getStructure []     _   _ =   "\n"
getStructure (n:ns) ns2 es =   "\tdata_in(" ++ show i ++ ") <=\tDIN(" ++ show i ++ ")"
                          ++ getInput (getConnections (unpack . head $ P.valuesByKey n "id") ns2 es)
                          ++ getStructure ns ns2 es
                          where
                              i = getIndex (unpack . head $ P.valuesByKey n "id") ns2 0

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

createSignals :: [P.Node] -> String
createSignals ns = do
    let nRegs   = length ns
        sigsIn  = "\tSIGNAL data_in  : STD_LOGIC_VECTOR(" ++ show (nRegs-1) ++ " downto 0);\n"
        sigsOut = "\tSIGNAL data_out : STD_LOGIC_VECTOR(" ++ show (nRegs-1) ++ " downto 0);\n\n"
    sigsIn ++ sigsOut

bindRegisters :: [P.Node] -> Int -> String
bindRegisters [] _     = "\n"
bindRegisters (n:ns) i = bindRegister (unpack . head $ P.valuesByKey n "id") i ++ bindRegisters ns (i+1)

bindRegister :: NodeName -> Int -> String
bindRegister name i =    "\tREG_" ++ name ++ " : ffd PORT MAP (\n"
                      ++ "\t\tCLK\t=>\tCLK,\n"
                      ++ "\t\tRST\t=>\tRST,\n"
                      ++ "\t\tEN\t=>\tEN(" ++ show i ++ "),\n"
                      ++ "\t\tD\t=>\tdata_in(" ++ show i ++ "),\n"
                      ++ "\t\tQ\t=>\tdata_out(" ++ show i ++ "));\n"

getIndex :: NodeName -> [P.Node] -> Int -> NodeIndex
getIndex nn [] _ = error $ "Node " ++ nn ++ " is not present in the graph"
getIndex n1 nb i
    | n1 == n2  = i
    | otherwise = getIndex n1 ns (i+1)
    where
      n2 = unpack . head $ P.valuesByKey (head nb) "id"
      ns = tail nb

getConnections :: NodeName -> [P.Node] -> [P.Edge] -> [NodeIndex]
getConnections _ _ []         = []
getConnections name ns es
    | name == source    = getIndex target ns 0 : getConnections name ns (tail es)
    | name == target    = getIndex source ns 0 : getConnections name ns (tail es)
    | otherwise         = getConnections name ns (tail es)
    where
      source = unpack . head $ P.valuesByKey (head es) "source"
      target = unpack . head $ P.valuesByKey (head es) "target"
