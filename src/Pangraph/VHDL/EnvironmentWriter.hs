module Pangraph.VHDL.EnvironmentWriter
( writeEnvironmentVhdl )where

import Data.List
import Pangraph.Util.Types

writeEnvironmentVhdl :: ShortFile -> String
writeEnvironmentVhdl (ShortFile (g:gs)) = do
    let library     = createLibrary
        entity      = createEntity g
        archOpen    = openArchitecture g
        modules     = instantiateModules g
        wires       = connectWires g
        archClose   = closeArchitecture
    library ++ entity ++ archOpen ++ modules ++ wires ++ archClose

createLibrary :: String
createLibrary =     "-- File generated automatically\n"
                ++  "LIBRARY ieee;\n"
                ++  "USE ieee.std_logic_1164.all;\n"
                ++  "USE ieee.numeric_std.all;\n"
                ++  "USE ieee.std_logic_unsigned.all;\n"
                ++  "LIBRARY work;\n\n"

createEntity :: ShortGraph -> String
createEntity (ShortGraph ns _) =
                    "ENTITY FANTASI IS\n"
                 ++ "\tPORT (\n"
                 ++ "\t\tCLK\t: IN\tstd_logic;\n"
                 ++ "\t\tRST\t: IN\tstd_logic;\n"
                 ++ "\t\tRST_SHIFT\t: IN\tstd_logic;\n"
                 ++ "\t\tEN\t: IN\tstd_logic;\n"
                 ++ "\t\tEN_NODES\t: IN\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                 ++ "\t\tSTART\t: IN\tstd_logic;\n"
                 ++ "\t\tDIN\t: IN\tstd_logic;\n"
                 ++ "\t\tDONE\t: OUT\tstd_logic;\n"
                 ++ "\t\tCOMPLETE\t: OUT\tstd_logic;\n"
                 ++ "\t\tRESULT\t: OUT\tstd_logic_vector(" ++ show (bitMul ns) ++ " downto 0));\n"
                 ++ "END FANTASI;\n\n"
                   where
                       nNodes = length ns

openArchitecture :: ShortGraph -> String
openArchitecture (ShortGraph ns _) = do
     let open       = "ARCHITECTURE test OF FANTASI IS\n\n"
         components = createComponents ns
         sigs       = createSignals ns
         begin      = "BEGIN\n\n"
     open ++ components ++ sigs ++ begin

createComponents :: [Node] -> String
createComponents ns = accumulator
                   ++ sync_register
                   ++ counter
                   ++ register
                   ++ graph ns
                   ++ shifter
                   ++ ffd
                   ++ delayer
                   ++ comparator

comparator :: String
comparator = "\tCOMPONENT Generic_zero_comparator IS\n"
         ++ "\t\tGENERIC (N : integer);\n"
         ++ "\t\tPORT (\n"
         ++ "\t\t\tOP\t: IN\tstd_logic_vector(N-1 downto 0);\n"
         ++ "\t\t\tEN\t: IN\tstd_logic;\n"
         ++ "\t\t\tEQ\t: OUT\tstd_logic);\n"
         ++ "\tEND COMPONENT;\n\n"

delayer :: String
delayer = "\tCOMPONENT Delayer IS\n"
          ++ "\t\tGENERIC (N : integer);\n"
          ++ "\t\tPORT (\n"
          ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
          ++ "\t\t\tRST\t: IN\tstd_logic;\n"
          ++ "\t\t\tEN\t: IN\tstd_logic;\n"
          ++ "\t\t\tDIN\t: IN\tstd_logic;\n"
          ++ "\t\t\tDOUT\t: OUT\tstd_logic);\n"
          ++ "\tEND COMPONENT;\n\n"

graph :: [Node] -> String
graph ns = "\tCOMPONENT Graph IS\n"
        ++ "\t\tPORT (\n"
        ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
        ++ "\t\t\tRST\t: IN\tstd_logic;\n"
        ++ "\t\t\tEN\t: IN\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
        ++ "\t\t\tDIN\t: IN\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
        ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(" ++ show (nNodes-1) ++ " downto 0));\n"
        ++ "\tEND COMPONENT;\n\n"
           where
               nNodes = length ns

accumulator :: String
accumulator = "\tCOMPONENT Generic_accumulator IS\n"
           ++ "\t\tGENERIC (N : integer);\n"
           ++ "\t\tPORT (\n"
           ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
           ++ "\t\t\tRST\t: IN\tstd_logic;\n"
           ++ "\t\t\tEN\t: IN\tstd_logic;\n"
           ++ "\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n"
           ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(N downto 0));\n"
           ++ "\tEND COMPONENT;\n\n"

sync_register :: String
sync_register = "\tCOMPONENT Generic_sync_register IS\n"
             ++ "\t\tGENERIC (N : integer);\n"
             ++ "\t\tPORT (\n"
             ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
             ++ "\t\t\tRST\t: IN\tstd_logic;\n"
             ++ "\t\t\tEN\t: IN\tstd_logic;\n"
             ++ "\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n"
             ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n"
             ++ "\tEND COMPONENT;\n\n"

shifter :: String
shifter = "\tCOMPONENT Generic_shift_register_input IS\n"
             ++ "\t\tGENERIC (N : integer);\n"
             ++ "\t\tPORT (\n"
             ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
             ++ "\t\t\tRST\t: IN\tstd_logic;\n"
             ++ "\t\t\tEN\t: IN\tstd_logic;\n"
             ++ "\t\t\tSTART\t: IN\tstd_logic;\n"
             ++ "\t\t\tDIN\t: IN\tstd_logic;\n"
             ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n"
             ++ "\tEND COMPONENT;\n\n"

ffd :: String
ffd =           "\tCOMPONENT ffd IS\n"
             ++ "\t\tPORT (\n"
             ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
             ++ "\t\t\tRST\t: IN\tstd_logic;\n"
             ++ "\t\t\tEN\t: IN\tstd_logic;\n"
             ++ "\t\t\tD\t: IN\tstd_logic;\n"
             ++ "\t\t\tQ\t: OUT\tstd_logic);\n"
             ++ "\tEND COMPONENT;\n\n"

register :: String
register = "\tCOMPONENT Generic_register IS\n"
              ++ "\t\tGENERIC (N : integer);\n"
              ++ "\t\tPORT (\n"
              ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
              ++ "\t\t\tRST\t: IN\tstd_logic;\n"
              ++ "\t\t\tEN\t: IN\tstd_logic;\n"
              ++ "\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n"
              ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n"
              ++ "\tEND COMPONENT;\n\n"

counter :: String
counter = "\tCOMPONENT Generic_counter IS\n"
       ++ "\t\tGENERIC (N : integer);\n"
       ++ "\t\tPORT (\n"
       ++ "\t\t\tCLK\t: IN\tstd_logic;\n"
       ++ "\t\t\tRST\t: IN\tstd_logic;\n"
       ++ "\t\t\tEN\t: IN\tstd_logic;\n"
       ++ "\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n"
       ++ "\tEND COMPONENT;\n\n"

createSignals :: [Node] -> String
createSignals ns = "\tSIGNAL in_network\t: std_logic_vector(" ++ show (nNodes) ++ " downto 0);\n"
                ++ "\tSIGNAL sync_in\t\t: std_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                ++ "\tSIGNAL sync_out\t: std_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                ++ "\tSIGNAL count\t\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL count_sum\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL count_mul\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL count_mul2\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL sum\t\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL sum_mul\t\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL sum_mul2\t\t: std_logic_vector(" ++ show ((bitSum ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL mul\t\t: std_logic_vector(" ++ show ((bitMul ns)-1) ++ " downto 0);\n"
                ++ "\tSIGNAL start_del\t\t: std_logic;\n"
                ++ "\tSIGNAL start_counting\t: std_logic;\n"
                ++ "\tSIGNAL enable_reg_del\t: std_logic_vector(" ++ show (nNodes-1) ++ " downto 0);\n"
                ++ "\tSIGNAL done1, done2, done3, done_res\t\t: std_logic;\n"
                ++ "\tSIGNAL res, res2\t\t: std_logic_vector(" ++ show (bitMul ns) ++ " downto 0);\n"
                ++ "\tSIGNAL comparator_en\t\t: std_logic;\n\n"
                  where
                    nNodes = length ns

instantiateModules :: ShortGraph -> String
instantiateModules (ShortGraph ns _) =  delayer_enable_nodes ns
                                     ++ network ns
                                     ++ synchroniser ns
                                     ++ genericCounter ns
                                     ++ reg_counter ns
                                     ++ genericAccumulator ns
                                     ++ reg_counter_mul ns
                                     ++ reg_counter_mul2 ns
                                     ++ reg_sum_mul ns
                                     ++ reg_sum_mul2 ns
                                     ++ shift_reg ns
                                     ++ start_delayer
                                     ++ counter_delayer
                                     ++ adder_comparator ns
                                     ++ comparator_delayer ns
                                     ++ comparator_delayer_result ns
                                     ++ done_latch
                                     ++ done_circuit
                                     ++ output_wires ns

output_wires :: [Node] -> String
output_wires ns =  "\tRESULT <= res;\n"
                ++ "\tCOMPLETE <= in_network("++ show nNodes ++ ");\n\n"
                  where
                    nNodes = length ns

done_circuit :: String
done_circuit =  "\tdone3 <= done_res OR done2;\n"
           ++ "\tDONE <= done2;\n\n"

done_latch :: String
done_latch =  "\tDONE_LATCH : ffd\n"
           ++ "\t\tPORT MAP(\n"
           ++ "\t\t\tCLK\t=> CLK,\n"
           ++ "\t\t\tRST\t=> RST,\n"
           ++ "\t\t\tEN\t=> EN,\n"
           ++ "\t\t\tD\t=> done3,\n"
           ++ "\t\t\tQ\t=> done2);\n\n"



adder_comparator :: [Node] -> String
adder_comparator ns =  "\tRESULT_COMPARATOR : Generic_zero_comparator\n"
                ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
                ++ "\t\tPORT MAP(\n"
                ++ "\t\t\tOP\t=> sum_mul,\n"
                ++ "\t\t\tEN\t=> comparator_en,\n"
                ++ "\t\t\tEQ\t=> done1);\n\n"

delayer_enable_nodes :: [Node] -> String
delayer_enable_nodes ns =  "\tDELAYER_ENABLE : for i in 0 to " ++ show (length ns - 1) ++ " generate\n"
                        ++ "\t\tenable_reg_del(i) <= EN_NODES(i) AND start_del;\n"
                        ++ "\tend generate;\n\n"

network :: [Node] -> String
network ns =  "\tNETWORK : Graph\n"
        ++ "\t\tPORT MAP(\n"
        ++ "\t\t\tCLK\t=> CLK,\n"
        ++ "\t\t\tRST\t=> RST,\n"
        ++ "\t\t\tEN\t=> enable_reg_del,\n"
        ++ "\t\t\tDIN\t=> in_network("++ show (nNodes-1) ++ " downto 0),\n"
        ++ "\t\t\tDOUT\t=> sync_in);\n\n"
          where
            nNodes = length ns

synchroniser :: [Node] -> String
synchroniser ns =  "\tSYNCHRONISER : Generic_sync_register\n"
                ++ "\t\tGENERIC MAP(" ++ show nNodes ++ ")\n"
                ++ "\t\tPORT MAP(\n"
                ++ "\t\t\tCLK\t=> CLK,\n"
                ++ "\t\t\tRST\t=> RST,\n"
                ++ "\t\t\tEN\t=> EN,\n"
                ++ "\t\t\tDIN\t=> sync_in,\n"
                ++ "\t\t\tDOUT\t=> sync_out);\n\n"
                  where
                    nNodes = length ns

shift_reg :: [Node] -> String
shift_reg ns =  "\tSHIFT_REG : Generic_shift_register_input\n"
                ++ "\t\tGENERIC MAP(" ++ show (nNodes+1) ++ ")\n"
                ++ "\t\tPORT MAP(\n"
                ++ "\t\t\tCLK\t=> CLK,\n"
                ++ "\t\t\tRST\t=> RST_SHIFT,\n"
                ++ "\t\t\tEN\t=> EN,\n"
                ++ "\t\t\tSTART\t=> START,\n"
                ++ "\t\t\tDIN\t=> DIN,\n" -- ++ "\t\t\tDIN\t=> DIN,\n"
                ++ "\t\t\tDOUT\t=> in_network);\n\n"
                  where
                    nNodes = length ns

start_delayer :: String
start_delayer =  "\tSTART_DELAYER : Delayer\n"
        ++ "\t\tGENERIC MAP (2)\n"
        ++ "\t\tPORT MAP(\n"
        ++ "\t\t\tCLK\t=> CLK,\n"
        ++ "\t\t\tRST\t=> RST,\n"
        ++ "\t\t\tEN\t=> EN,\n"
        ++ "\t\t\tDIN\t=> START,\n"
        ++ "\t\t\tDOUT\t=> start_del);\n\n"

counter_delayer :: String
counter_delayer =  "\tCOUNTER_DELAYER : Delayer\n"
                ++ "\t\tGENERIC MAP (1)\n"
                ++ "\t\tPORT MAP(\n"
                ++ "\t\t\tCLK\t=> CLK,\n"
                ++ "\t\t\tRST\t=> RST,\n"
                ++ "\t\t\tEN\t=> EN,\n"
                ++ "\t\t\tDIN\t=> start_del,\n"
                ++ "\t\t\tDOUT\t=> start_counting);\n\n"

comparator_delayer :: [Node] -> String
comparator_delayer ns =  "\tCOMPARATOR_DELAYER : Delayer\n"
                  ++ "\t\tGENERIC MAP (3)\n"
                  ++ "\t\tPORT MAP(\n"
                  ++ "\t\t\tCLK\t=> CLK,\n"
                  ++ "\t\t\tRST\t=> RST,\n"
                  ++ "\t\t\tEN\t=> EN,\n"
                  ++ "\t\t\tDIN\t=> start_del,\n"
                  ++ "\t\t\tDOUT\t=> comparator_en);\n\n"

comparator_delayer_result :: [Node] -> String
comparator_delayer_result ns =  "\tCOMPARATOR_DELAYER_RESULT : Delayer\n"
                  ++ "\t\tGENERIC MAP (3)\n"
                  ++ "\t\tPORT MAP(\n"
                  ++ "\t\t\tCLK\t=> CLK,\n"
                  ++ "\t\t\tRST\t=> RST,\n"
                  ++ "\t\t\tEN\t=> EN,\n"
                  ++ "\t\t\tDIN\t=> done1,\n"
                  ++ "\t\t\tDOUT\t=> done_res);\n\n"

genericCounter :: [Node] -> String
genericCounter ns =  "\tCOUNTER : Generic_counter\n"
                  ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
                  ++ "\t\tPORT MAP(\n"
                  ++ "\t\t\tCLK\t=> CLK,\n"
                  ++ "\t\t\tRST\t=> RST,\n"
                  ++ "\t\t\tEN\t=> start_counting,\n"
                  ++ "\t\t\tDOUT\t=> count);\n\n"

reg_counter :: [Node] -> String
reg_counter ns =  "\tREG_COUNTER : Generic_register\n"
               ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
               ++ "\t\tPORT MAP(\n"
               ++ "\t\t\tCLK\t=> CLK,\n"
               ++ "\t\t\tRST\t=> RST,\n"
               ++ "\t\t\tEN\t=> EN,\n"
               ++ "\t\t\tDIN\t=> count,\n"
               ++ "\t\t\tDOUT\t=> count_sum);\n\n"

reg_counter_mul :: [Node] -> String
reg_counter_mul ns =  "\tREG_COUNTER_MUL : Generic_register\n"
               ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
               ++ "\t\tPORT MAP(\n"
               ++ "\t\t\tCLK\t=> CLK,\n"
               ++ "\t\t\tRST\t=> RST,\n"
               ++ "\t\t\tEN\t=> EN,\n"
               ++ "\t\t\tDIN\t=> count_sum,\n"
               ++ "\t\t\tDOUT\t=> count_mul);\n\n"

reg_counter_mul2 :: [Node] -> String
reg_counter_mul2 ns =  "\tREG_COUNTER_MUL2 : Generic_register\n"
              ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
              ++ "\t\tPORT MAP(\n"
              ++ "\t\t\tCLK\t=> CLK,\n"
              ++ "\t\t\tRST\t=> RST,\n"
              ++ "\t\t\tEN\t=> EN,\n"
              ++ "\t\t\tDIN\t=> count_mul,\n"
              ++ "\t\t\tDOUT\t=> count_mul2);\n\n"

reg_sum_mul :: [Node] -> String
reg_sum_mul ns =  "\tREG_SUM_MUL : Generic_register\n"
               ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
               ++ "\t\tPORT MAP(\n"
               ++ "\t\t\tCLK\t=> CLK,\n"
               ++ "\t\t\tRST\t=> RST,\n"
               ++ "\t\t\tEN\t=> EN,\n"
               ++ "\t\t\tDIN\t=> sum,\n"
               ++ "\t\t\tDOUT\t=> sum_mul);\n\n"

reg_sum_mul2 :: [Node] -> String
reg_sum_mul2 ns =  "\tREG_SUM_MUL2 : Generic_register\n"
              ++ "\t\tGENERIC MAP(" ++ show (bitSum ns) ++ ")\n"
              ++ "\t\tPORT MAP(\n"
              ++ "\t\t\tCLK\t=> CLK,\n"
              ++ "\t\t\tRST\t=> RST,\n"
              ++ "\t\t\tEN\t=> EN,\n"
              ++ "\t\t\tDIN\t=> sum_mul,\n"
              ++ "\t\t\tDOUT\t=> sum_mul2);\n\n"

genericAccumulator :: [Node] -> String
genericAccumulator ns =  "\tACCUMULATOR : Generic_accumulator\n"
                      ++ "\t\tGENERIC MAP(" ++ show (bitMul ns) ++ ")\n"
                      ++ "\t\tPORT MAP(\n"
                      ++ "\t\t\tCLK\t=> CLK,\n"
                      ++ "\t\t\tRST\t=> RST,\n"
                      ++ "\t\t\tEN\t=> start_del,\n"
                      ++ "\t\t\tDIN\t=> mul,\n"
                      ++ "\t\t\tDOUT\t=> res);\n\n"

connectWires :: ShortGraph -> String
connectWires (ShortGraph ns _) =  "\tsum <= " ++ adders ns (nNodes-1)
                               ++ multiplier
                                  where
                                    nNodes = length ns

adders :: [Node] -> Int -> String
adders ns 0 = "\t\t(\"" ++ generateZeros ((bitSum ns)-1) ++ "\" & sync_out(0));\n\n"
adders ns n = "\t\t(\"" ++ generateZeros ((bitSum ns)-1) ++ "\" & sync_out(" ++ show (n) ++ "))\t+\n"
                        ++ adders ns (n-1)

multiplier :: String
multiplier = "\tmul <= sum_mul2 * count_mul2;\n\n"

generateZeros :: Int -> String
generateZeros 0 = ""
generateZeros n = "0" ++ generateZeros (n-1)

bitSum :: [Node] -> Int
bitSum ns = ceiling(logBase 2.0 (fromIntegral nNodes))
  where
    nNodes = length ns

bitMul :: [Node] -> Int
bitMul ns = (bitSum ns) * 2

getNodes :: ShortGraph -> [Node]
getNodes (ShortGraph ns _) = ns

closeArchitecture :: String
closeArchitecture = "\nEND test;"
