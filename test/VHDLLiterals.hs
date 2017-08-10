{-# LANGUAGE OverloadedStrings #-}

module VHDLLiterals where

import Data.ByteString
-- Note on literals in the file
-- Literals pointing to this label must have every character
-- preserved as they become multiline string. As the test cases
-- are using the Eq of String to determine correctness.


-- examples/graphs/n1/n1.graphml
graphfileN1 :: ByteString
graphfileN1 =
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
  \<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\"\n\
  \    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n\
  \    xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns\n\
  \     http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd\">\n\
  \  <graph id=\"G\" edgedefault=\"undirected\">\n\
  \    <node id=\"v00\"/>\n\
  \    <node id=\"v01\"/>\n\
  \    <node id=\"v02\"/>\n\
  \    <node id=\"v03\"/>\n\
  \    <node id=\"v04\"/>\n\
  \    <node id=\"v05\"/>\n\
  \    <node id=\"v06\"/>\n\
  \    <node id=\"v07\"/>\n\
  \    <node id=\"v08\"/>\n\
  \    <node id=\"v09\"/>\n\
  \    <node id=\"v10\"/>\n\
  \    <node id=\"v11\"/>\n\
  \    <node id=\"v12\"/>\n\
  \    <node id=\"v13\"/>\n\
  \    <node id=\"v14\"/>\n\
  \    <edge source=\"v00\" target=\"v01\"/>\n\
  \    <edge source=\"v00\" target=\"v02\"/>\n\
  \    <edge source=\"v00\" target=\"v03\"/>\n\
  \    <edge source=\"v01\" target=\"v04\"/>\n\
  \    <edge source=\"v01\" target=\"v05\"/>\n\
  \    <edge source=\"v02\" target=\"v05\"/>\n\
  \    <edge source=\"v02\" target=\"v06\"/>\n\
  \    <edge source=\"v03\" target=\"v06\"/>\n\
  \    <edge source=\"v03\" target=\"v07\"/>\n\
  \    <edge source=\"v04\" target=\"v08\"/>\n\
  \    <edge source=\"v05\" target=\"v08\"/>\n\
  \    <edge source=\"v05\" target=\"v09\"/>\n\
  \    <edge source=\"v06\" target=\"v09\"/>\n\
  \    <edge source=\"v06\" target=\"v10\"/>\n\
  \    <edge source=\"v07\" target=\"v10\"/>\n\
  \    <edge source=\"v08\" target=\"v11\"/>\n\
  \    <edge source=\"v09\" target=\"v12\"/>\n\
  \    <edge source=\"v10\" target=\"v13\"/>\n\
  \    <edge source=\"v11\" target=\"v12\"/>\n\
  \    <edge source=\"v12\" target=\"v14\"/>\n\
  \    <edge source=\"v13\" target=\"v12\"/>\n\
  \    </graph>\n\
  \</graphml>"

-- examples/graphs/n1/n1-sim-environment.vhdl
-- See note in header about literals
enviroFile1 :: ByteString
enviroFile1 =
    "-- File generated automatically\n\
    \LIBRARY ieee;\n\
    \USE ieee.std_logic_1164.all;\n\
    \USE ieee.numeric_std.all;\n\
    \USE ieee.std_logic_unsigned.all;\n\
    \LIBRARY work;\n\
    \\n\
    \ENTITY FANTASI IS\n\
    \\tPORT (\n\
    \\t\tCLK\t: IN\tstd_logic;\n\
    \\t\tRST\t: IN\tstd_logic;\n\
    \\t\tRST_SHIFT\t: IN\tstd_logic;\n\
    \\t\tEN\t: IN\tstd_logic;\n\
    \\t\tEN_NODES\t: IN\tstd_logic_vector(14 downto 0);\n\
    \\t\tSTART\t: IN\tstd_logic;\n\
    \\t\tDIN\t: IN\tstd_logic;\n\
    \\t\tDONE\t: OUT\tstd_logic;\n\
    \\t\tCOMPLETE\t: OUT\tstd_logic;\n\
    \\t\tRESULT\t: OUT\tstd_logic_vector(8 downto 0));\n\
    \END FANTASI;\n\
    \\n\
    \ARCHITECTURE test OF FANTASI IS\n\
    \\n\
    \\tCOMPONENT Generic_accumulator IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(N downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Generic_sync_register IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Generic_counter IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Generic_register IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tDIN\t: IN\tstd_logic_vector(N-1 downto 0);\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Graph IS\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic_vector(14 downto 0);\n\
    \\t\t\tDIN\t: IN\tstd_logic_vector(14 downto 0);\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(14 downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Generic_shift_register_input IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tSTART\t: IN\tstd_logic;\n\
    \\t\t\tDIN\t: IN\tstd_logic;\n\
    \\t\t\tDOUT\t: OUT\tstd_logic_vector(N-1 downto 0));\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT ffd IS\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tD\t: IN\tstd_logic;\n\
    \\t\t\tQ\t: OUT\tstd_logic);\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Delayer IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tCLK\t: IN\tstd_logic;\n\
    \\t\t\tRST\t: IN\tstd_logic;\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tDIN\t: IN\tstd_logic;\n\
    \\t\t\tDOUT\t: OUT\tstd_logic);\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tCOMPONENT Generic_zero_comparator IS\n\
    \\t\tGENERIC (N : integer);\n\
    \\t\tPORT (\n\
    \\t\t\tOP\t: IN\tstd_logic_vector(N-1 downto 0);\n\
    \\t\t\tEN\t: IN\tstd_logic;\n\
    \\t\t\tEQ\t: OUT\tstd_logic);\n\
    \\tEND COMPONENT;\n\
    \\n\
    \\tSIGNAL in_network\t: std_logic_vector(15 downto 0);\n\
    \\tSIGNAL sync_in\t\t: std_logic_vector(14 downto 0);\n\
    \\tSIGNAL sync_out\t: std_logic_vector(14 downto 0);\n\
    \\tSIGNAL count\t\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL count_sum\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL count_mul\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL count_mul2\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL sum\t\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL sum_mul\t\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL sum_mul2\t\t: std_logic_vector(3 downto 0);\n\
    \\tSIGNAL mul\t\t: std_logic_vector(7 downto 0);\n\
    \\tSIGNAL start_del\t\t: std_logic;\n\
    \\tSIGNAL start_counting\t: std_logic;\n\
    \\tSIGNAL enable_reg_del\t: std_logic_vector(14 downto 0);\n\
    \\tSIGNAL done1, done2, done3, done_res\t\t: std_logic;\n\
    \\tSIGNAL res, res2\t\t: std_logic_vector(8 downto 0);\n\
    \\tSIGNAL comparator_en\t\t: std_logic;\n\
    \\n\
    \BEGIN\n\
    \\n\
    \\tDELAYER_ENABLE : for i in 0 to 14 generate\n\
    \\t\tenable_reg_del(i) <= EN_NODES(i) AND start_del;\n\
    \\tend generate;\n\
    \\n\
    \\tNETWORK : Graph\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> enable_reg_del,\n\
    \\t\t\tDIN\t=> in_network(14 downto 0),\n\
    \\t\t\tDOUT\t=> sync_in);\n\
    \\n\
    \\tSYNCHRONISER : Generic_sync_register\n\
    \\t\tGENERIC MAP(15)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> sync_in,\n\
    \\t\t\tDOUT\t=> sync_out);\n\
    \\n\
    \\tCOUNTER : Generic_counter\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> start_counting,\n\
    \\t\t\tDOUT\t=> count);\n\
    \\n\
    \\tREG_COUNTER : Generic_register\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> count,\n\
    \\t\t\tDOUT\t=> count_sum);\n\
    \\n\
    \\tACCUMULATOR : Generic_accumulator\n\
    \\t\tGENERIC MAP(8)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> start_del,\n\
    \\t\t\tDIN\t=> mul,\n\
    \\t\t\tDOUT\t=> res);\n\
    \\n\
    \\tREG_COUNTER_MUL : Generic_register\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> count_sum,\n\
    \\t\t\tDOUT\t=> count_mul);\n\
    \\n\
    \\tREG_COUNTER_MUL2 : Generic_register\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> count_mul,\n\
    \\t\t\tDOUT\t=> count_mul2);\n\
    \\n\
    \\tREG_SUM_MUL : Generic_register\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> sum,\n\
    \\t\t\tDOUT\t=> sum_mul);\n\
    \\n\
    \\tREG_SUM_MUL2 : Generic_register\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> sum_mul,\n\
    \\t\t\tDOUT\t=> sum_mul2);\n\
    \\n\
    \\tSHIFT_REG : Generic_shift_register_input\n\
    \\t\tGENERIC MAP(16)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST_SHIFT,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tSTART\t=> START,\n\
    \\t\t\tDIN\t=> DIN,\n\
    \\t\t\tDOUT\t=> in_network);\n\
    \\n\
    \\tSTART_DELAYER : Delayer\n\
    \\t\tGENERIC MAP (2)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> START,\n\
    \\t\t\tDOUT\t=> start_del);\n\
    \\n\
    \\tCOUNTER_DELAYER : Delayer\n\
    \\t\tGENERIC MAP (1)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> start_del,\n\
    \\t\t\tDOUT\t=> start_counting);\n\
    \\n\
    \\tRESULT_COMPARATOR : Generic_zero_comparator\n\
    \\t\tGENERIC MAP(4)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tOP\t=> sum_mul,\n\
    \\t\t\tEN\t=> comparator_en,\n\
    \\t\t\tEQ\t=> done1);\n\
    \\n\
    \\tCOMPARATOR_DELAYER : Delayer\n\
    \\t\tGENERIC MAP (3)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> start_del,\n\
    \\t\t\tDOUT\t=> comparator_en);\n\
    \\n\
    \\tCOMPARATOR_DELAYER_RESULT : Delayer\n\
    \\t\tGENERIC MAP (3)\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tDIN\t=> done1,\n\
    \\t\t\tDOUT\t=> done_res);\n\
    \\n\
    \\tDONE_LATCH : ffd\n\
    \\t\tPORT MAP(\n\
    \\t\t\tCLK\t=> CLK,\n\
    \\t\t\tRST\t=> RST,\n\
    \\t\t\tEN\t=> EN,\n\
    \\t\t\tD\t=> done3,\n\
    \\t\t\tQ\t=> done2);\n\
    \\n\
    \\tdone3 <= done_res OR done2;\n\
    \\tDONE <= done2;\n\
    \\n\
    \\tRESULT <= res;\n\
    \\tCOMPLETE <= in_network(15);\n\
    \\n\
    \\tsum <= \t\t(\"000\" & sync_out(14))\t+\n\
    \\t\t(\"000\" & sync_out(13))\t+\n\
    \\t\t(\"000\" & sync_out(12))\t+\n\
    \\t\t(\"000\" & sync_out(11))\t+\n\
    \\t\t(\"000\" & sync_out(10))\t+\n\
    \\t\t(\"000\" & sync_out(9))\t+\n\
    \\t\t(\"000\" & sync_out(8))\t+\n\
    \\t\t(\"000\" & sync_out(7))\t+\n\
    \\t\t(\"000\" & sync_out(6))\t+\n\
    \\t\t(\"000\" & sync_out(5))\t+\n\
    \\t\t(\"000\" & sync_out(4))\t+\n\
    \\t\t(\"000\" & sync_out(3))\t+\n\
    \\t\t(\"000\" & sync_out(2))\t+\n\
    \\t\t(\"000\" & sync_out(1))\t+\n\
    \\t\t(\"000\" & sync_out(0));\n\
    \\n\
    \\tmul <= sum_mul2 * count_mul2;\n\
    \\n\
    \\n\
    \END test;"

-- examples/graphs/n1/n1-graph.vhdl
-- See note near header about literals
vhdlGraph1 :: ByteString
vhdlGraph1 =
  "-- Nodes: 15 - Edges: 21\n\
  \-- File generated automatically\n\
  \LIBRARY ieee;\n\
  \USE ieee.std_logic_1164.all;\n\
  \\n\
  \LIBRARY work;\n\
  \\n\
  \ENTITY Graph IS\n\
  \\tPORT (\n\
  \\t\tCLK\t: IN\tstd_logic;\n\
  \\t\tRST\t: IN\tstd_logic;\n\
  \\t\tEN\t: IN\tstd_logic_vector(14 downto 0);\n\
  \\t\tDIN\t: IN\tstd_logic_vector(14 downto 0);\n\
  \\t\tDOUT\t: OUT\tstd_logic_vector(14 downto 0));\n\
  \END Graph;\n\
  \\n\
  \ARCHITECTURE Graph_circuit OF Graph IS\n\
  \\n\
  \\tCOMPONENT ffd IS\n\
  \\t\tPORT (\n\
  \\t\t\tCLK\t: IN\tstd_logic;\n\
  \\t\t\tRST\t: IN\tstd_logic;\n\
  \\t\t\tEN\t: IN\tstd_logic;\n\
  \\t\t\tD\t: IN\tstd_logic;\n\
  \\t\t\tQ\t: OUT\tstd_logic\n\
  \\t\t);\n\
  \\tEND COMPONENT;\n\
  \\n\
  \\tSIGNAL data_in  : STD_LOGIC_VECTOR(14 downto 0);\n\
  \\tSIGNAL data_out : STD_LOGIC_VECTOR(14 downto 0);\n\
  \\n\
  \BEGIN\n\
  \\n\
  \\t-- Registers\n\
  \\tREG_v00 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(0),\n\
  \\t\tD\t=>\tdata_in(0),\n\
  \\t\tQ\t=>\tdata_out(0));\n\
  \\tREG_v01 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(1),\n\
  \\t\tD\t=>\tdata_in(1),\n\
  \\t\tQ\t=>\tdata_out(1));\n\
  \\tREG_v02 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(2),\n\
  \\t\tD\t=>\tdata_in(2),\n\
  \\t\tQ\t=>\tdata_out(2));\n\
  \\tREG_v03 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(3),\n\
  \\t\tD\t=>\tdata_in(3),\n\
  \\t\tQ\t=>\tdata_out(3));\n\
  \\tREG_v04 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(4),\n\
  \\t\tD\t=>\tdata_in(4),\n\
  \\t\tQ\t=>\tdata_out(4));\n\
  \\tREG_v05 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(5),\n\
  \\t\tD\t=>\tdata_in(5),\n\
  \\t\tQ\t=>\tdata_out(5));\n\
  \\tREG_v06 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(6),\n\
  \\t\tD\t=>\tdata_in(6),\n\
  \\t\tQ\t=>\tdata_out(6));\n\
  \\tREG_v07 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(7),\n\
  \\t\tD\t=>\tdata_in(7),\n\
  \\t\tQ\t=>\tdata_out(7));\n\
  \\tREG_v08 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(8),\n\
  \\t\tD\t=>\tdata_in(8),\n\
  \\t\tQ\t=>\tdata_out(8));\n\
  \\tREG_v09 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(9),\n\
  \\t\tD\t=>\tdata_in(9),\n\
  \\t\tQ\t=>\tdata_out(9));\n\
  \\tREG_v10 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(10),\n\
  \\t\tD\t=>\tdata_in(10),\n\
  \\t\tQ\t=>\tdata_out(10));\n\
  \\tREG_v11 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(11),\n\
  \\t\tD\t=>\tdata_in(11),\n\
  \\t\tQ\t=>\tdata_out(11));\n\
  \\tREG_v12 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(12),\n\
  \\t\tD\t=>\tdata_in(12),\n\
  \\t\tQ\t=>\tdata_out(12));\n\
  \\tREG_v13 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(13),\n\
  \\t\tD\t=>\tdata_in(13),\n\
  \\t\tQ\t=>\tdata_out(13));\n\
  \\tREG_v14 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(14),\n\
  \\t\tD\t=>\tdata_in(14),\n\
  \\t\tQ\t=>\tdata_out(14));\n\
  \\n\
  \\t-- Wire connections: inputs\n\
  \\tdata_in(0) <=\tDIN(0)\n\
  \\t\t\tOR data_out(1)\n\
  \\t\t\tOR data_out(2)\n\
  \\t\t\tOR data_out(3);\n\
  \\tdata_in(1) <=\tDIN(1)\n\
  \\t\t\tOR data_out(0)\n\
  \\t\t\tOR data_out(4)\n\
  \\t\t\tOR data_out(5);\n\
  \\tdata_in(2) <=\tDIN(2)\n\
  \\t\t\tOR data_out(0)\n\
  \\t\t\tOR data_out(5)\n\
  \\t\t\tOR data_out(6);\n\
  \\tdata_in(3) <=\tDIN(3)\n\
  \\t\t\tOR data_out(0)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(7);\n\
  \\tdata_in(4) <=\tDIN(4)\n\
  \\t\t\tOR data_out(1)\n\
  \\t\t\tOR data_out(8);\n\
  \\tdata_in(5) <=\tDIN(5)\n\
  \\t\t\tOR data_out(1)\n\
  \\t\t\tOR data_out(2)\n\
  \\t\t\tOR data_out(8)\n\
  \\t\t\tOR data_out(9);\n\
  \\tdata_in(6) <=\tDIN(6)\n\
  \\t\t\tOR data_out(2)\n\
  \\t\t\tOR data_out(3)\n\
  \\t\t\tOR data_out(9)\n\
  \\t\t\tOR data_out(10);\n\
  \\tdata_in(7) <=\tDIN(7)\n\
  \\t\t\tOR data_out(3)\n\
  \\t\t\tOR data_out(10);\n\
  \\tdata_in(8) <=\tDIN(8)\n\
  \\t\t\tOR data_out(4)\n\
  \\t\t\tOR data_out(5)\n\
  \\t\t\tOR data_out(11);\n\
  \\tdata_in(9) <=\tDIN(9)\n\
  \\t\t\tOR data_out(5)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(12);\n\
  \\tdata_in(10) <=\tDIN(10)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(7)\n\
  \\t\t\tOR data_out(13);\n\
  \\tdata_in(11) <=\tDIN(11)\n\
  \\t\t\tOR data_out(8)\n\
  \\t\t\tOR data_out(12);\n\
  \\tdata_in(12) <=\tDIN(12)\n\
  \\t\t\tOR data_out(9)\n\
  \\t\t\tOR data_out(11)\n\
  \\t\t\tOR data_out(14)\n\
  \\t\t\tOR data_out(13);\n\
  \\tdata_in(13) <=\tDIN(13)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(12);\n\
  \\tdata_in(14) <=\tDIN(14)\n\
  \\t\t\tOR data_out(12);\n\
  \\n\
  \\t-- Wire connections: outputs\n\
  \\tDOUT(14) <= data_out(14);\n\
  \\tDOUT(13) <= data_out(13);\n\
  \\tDOUT(12) <= data_out(12);\n\
  \\tDOUT(11) <= data_out(11);\n\
  \\tDOUT(10) <= data_out(10);\n\
  \\tDOUT(9) <= data_out(9);\n\
  \\tDOUT(8) <= data_out(8);\n\
  \\tDOUT(7) <= data_out(7);\n\
  \\tDOUT(6) <= data_out(6);\n\
  \\tDOUT(5) <= data_out(5);\n\
  \\tDOUT(4) <= data_out(4);\n\
  \\tDOUT(3) <= data_out(3);\n\
  \\tDOUT(2) <= data_out(2);\n\
  \\tDOUT(1) <= data_out(1);\n\
  \\tDOUT(0) <= data_out(0);\n\
  \\n\
  \END Graph_circuit;"
