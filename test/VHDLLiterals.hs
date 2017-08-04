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


-- examples/graphs/n2/n2.graphml
graphfileN2 :: ByteString
graphfileN2 =
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
  \\n\
  \<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n\
  \\n\
  \  <graph id=\"G\" edgedefault=\"undirected\">\n\
  \    <node id=\"000001\">\n\
  \    </node>\n\
  \    <node id=\"000002\">\n\
  \    </node>\n\
  \    <node id=\"000003\">\n\
  \    </node>\n\
  \    <node id=\"000004\">\n\
  \    </node>\n\
  \    <node id=\"000005\">\n\
  \    </node>\n\
  \    <node id=\"000006\">\n\
  \    </node>\n\
  \    <node id=\"000007\">\n\
  \    </node>\n\
  \    <node id=\"000008\">\n\
  \    </node>\n\
  \    <node id=\"000009\">\n\
  \    </node>\n\
  \    <node id=\"000010\">\n\
  \    </node>\n\
  \    <node id=\"000011\">\n\
  \    </node>\n\
  \    <node id=\"000012\">\n\
  \    </node>\n\
  \    <node id=\"000013\">\n\
  \    </node>\n\
  \    <node id=\"000014\">\n\
  \    </node>\n\
  \    <node id=\"000015\">\n\
  \    </node>\n\
  \    <node id=\"000016\">\n\
  \    </node>\n\
  \    <node id=\"000017\">\n\
  \    </node>\n\
  \    <node id=\"000018\">\n\
  \    </node>\n\
  \    <node id=\"000019\">\n\
  \    </node>\n\
  \    <node id=\"000020\">\n\
  \    </node>\n\
  \    <node id=\"000021\">\n\
  \    </node>\n\
  \    <node id=\"000022\">\n\
  \    </node>\n\
  \    <node id=\"000023\">\n\
  \    </node>\n\
  \    <node id=\"000024\">\n\
  \    </node>\n\
  \    <node id=\"000025\">\n\
  \    </node>\n\
  \    <node id=\"000026\">\n\
  \    </node>\n\
  \    <node id=\"000027\">\n\
  \    </node>\n\
  \    <node id=\"000028\">\n\
  \    </node>\n\
  \    <node id=\"000029\">\n\
  \    </node>\n\
  \    <node id=\"000030\">\n\
  \    </node>\n\
  \    <node id=\"000031\">\n\
  \    </node>\n\
  \    <node id=\"000032\">\n\
  \    </node>\n\
  \    <node id=\"000033\">\n\
  \    </node>\n\
  \    <node id=\"000034\">\n\
  \    </node>\n\
  \    <node id=\"000035\">\n\
  \    </node>\n\
  \    <node id=\"000036\">\n\
  \    </node>\n\
  \    <node id=\"000037\">\n\
  \    </node>\n\
  \    <node id=\"000038\">\n\
  \    </node>\n\
  \    <node id=\"000039\">\n\
  \    </node>\n\
  \    <node id=\"000040\">\n\
  \    </node>\n\
  \    <node id=\"000041\">\n\
  \    </node>\n\
  \    <node id=\"000042\">\n\
  \    </node>\n\
  \    <node id=\"000043\">\n\
  \    </node>\n\
  \    <node id=\"000044\">\n\
  \    </node>\n\
  \    <node id=\"000045\">\n\
  \    </node>\n\
  \    <node id=\"000046\">\n\
  \    </node>\n\
  \    <node id=\"000047\">\n\
  \    </node>\n\
  \    <node id=\"000048\">\n\
  \    </node>\n\
  \    <node id=\"000049\">\n\
  \    </node>\n\
  \    <node id=\"000050\">\n\
  \    </node>\n\
  \    <node id=\"000051\">\n\
  \    </node>\n\
  \    <node id=\"000052\">\n\
  \    </node>\n\
  \    <node id=\"000053\">\n\
  \    </node>\n\
  \    <node id=\"000054\">\n\
  \    </node>\n\
  \    <node id=\"000055\">\n\
  \    </node>\n\
  \    <node id=\"000056\">\n\
  \    </node>\n\
  \    <node id=\"000057\">\n\
  \    </node>\n\
  \    <node id=\"000058\">\n\
  \    </node>\n\
  \    <node id=\"000059\">\n\
  \    </node>\n\
  \    <node id=\"000060\">\n\
  \    </node>\n\
  \    <node id=\"000061\">\n\
  \    </node>\n\
  \    <node id=\"000062\">\n\
  \    </node>\n\
  \    <node id=\"000063\">\n\
  \    </node>\n\
  \    <node id=\"000064\">\n\
  \    </node>\n\
  \    <node id=\"000065\">\n\
  \    </node>\n\
  \    <node id=\"000066\">\n\
  \    </node>\n\
  \    <node id=\"000067\">\n\
  \    </node>\n\
  \    <node id=\"000068\">\n\
  \    </node>\n\
  \    <node id=\"000069\">\n\
  \    </node>\n\
  \    <node id=\"000070\">\n\
  \    </node>\n\
  \    <node id=\"000071\">\n\
  \    </node>\n\
  \    <node id=\"000072\">\n\
  \    </node>\n\
  \    <node id=\"000073\">\n\
  \    </node>\n\
  \    <node id=\"000074\">\n\
  \    </node>\n\
  \    <node id=\"000075\">\n\
  \    </node>\n\
  \    <node id=\"000076\">\n\
  \    </node>\n\
  \    <node id=\"000077\">\n\
  \    </node>\n\
  \    <node id=\"000078\">\n\
  \    </node>\n\
  \    <node id=\"000079\">\n\
  \    </node>\n\
  \    <node id=\"000080\">\n\
  \    </node>\n\
  \    <node id=\"000081\">\n\
  \    </node>\n\
  \    <node id=\"000082\">\n\
  \    </node>\n\
  \    <node id=\"000083\">\n\
  \    </node>\n\
  \    <node id=\"000084\">\n\
  \    </node>\n\
  \    <node id=\"000085\">\n\
  \    </node>\n\
  \    <node id=\"000086\">\n\
  \    </node>\n\
  \    <node id=\"000087\">\n\
  \    </node>\n\
  \    <edge id=\"403\" source=\"000058\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"402\" source=\"000067\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"401\" source=\"000073\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"400\" source=\"000079\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"399\" source=\"000059\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"398\" source=\"000032\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"397\" source=\"000048\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"396\" source=\"000067\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"395\" source=\"000074\" target=\"000004\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"394\" source=\"000054\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"393\" source=\"000071\" target=\"000052\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"392\" source=\"000025\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"391\" source=\"000048\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"390\" source=\"000025\" target=\"000020\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"389\" source=\"000051\" target=\"000007\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"388\" source=\"000059\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"387\" source=\"000073\" target=\"000082\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"386\" source=\"000005\" target=\"000032\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"385\" source=\"000065\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"384\" source=\"000037\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"383\" source=\"000067\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"382\" source=\"000074\" target=\"000028\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"381\" source=\"000065\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"380\" source=\"000030\" target=\"000074\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"379\" source=\"000060\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"378\" source=\"000048\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"377\" source=\"000057\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"376\" source=\"000023\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"375\" source=\"000073\" target=\"000030\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"374\" source=\"000034\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"373\" source=\"000087\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"372\" source=\"000060\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"371\" source=\"000082\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"370\" source=\"000051\" target=\"000067\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"369\" source=\"000074\" target=\"000040\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"368\" source=\"000073\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"367\" source=\"000063\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"366\" source=\"000074\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"365\" source=\"000068\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"364\" source=\"000060\" target=\"000012\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"363\" source=\"000033\" target=\"000011\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"362\" source=\"000069\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"361\" source=\"000074\" target=\"000035\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"360\" source=\"000080\" target=\"000075\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"359\" source=\"000076\" target=\"000040\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"358\" source=\"000021\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"357\" source=\"000007\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"356\" source=\"000080\" target=\"000030\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"355\" source=\"000057\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"354\" source=\"000082\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"353\" source=\"000017\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"352\" source=\"000065\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"351\" source=\"000076\" target=\"000020\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"350\" source=\"000051\" target=\"000034\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"349\" source=\"000025\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"348\" source=\"000027\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"347\" source=\"000018\" target=\"000043\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"346\" source=\"000017\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"345\" source=\"000005\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"344\" source=\"000074\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"343\" source=\"000029\" target=\"000067\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"342\" source=\"000085\" target=\"000078\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"341\" source=\"000037\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"340\" source=\"000051\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"339\" source=\"000076\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"338\" source=\"000076\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"337\" source=\"000065\" target=\"000045\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"336\" source=\"000028\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"335\" source=\"000001\" target=\"000051\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"334\" source=\"000080\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"333\" source=\"000057\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"332\" source=\"000057\" target=\"000048\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"331\" source=\"000076\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"330\" source=\"000048\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"329\" source=\"000027\" target=\"000070\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"328\" source=\"000051\" target=\"000002\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"327\" source=\"000009\" target=\"000057\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"326\" source=\"000053\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"325\" source=\"000077\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"324\" source=\"000084\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"323\" source=\"000033\" target=\"000054\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"322\" source=\"000060\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"321\" source=\"000051\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"320\" source=\"000025\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"319\" source=\"000057\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"318\" source=\"000086\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"317\" source=\"000040\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"316\" source=\"000072\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"315\" source=\"000073\" target=\"000035\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"314\" source=\"000021\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"313\" source=\"000071\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"312\" source=\"000080\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"311\" source=\"000074\" target=\"000069\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"310\" source=\"000082\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"309\" source=\"000087\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"308\" source=\"000039\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"307\" source=\"000023\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"306\" source=\"000080\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"305\" source=\"000074\" target=\"000065\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"304\" source=\"000057\" target=\"000040\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"303\" source=\"000074\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"302\" source=\"000012\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"301\" source=\"000032\" target=\"000074\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"300\" source=\"000011\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"299\" source=\"000078\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"298\" source=\"000086\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"297\" source=\"000034\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"296\" source=\"000053\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"295\" source=\"000057\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"294\" source=\"000032\" target=\"000035\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"293\" source=\"000033\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"292\" source=\"000025\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"291\" source=\"000054\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"290\" source=\"000015\" target=\"000067\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"289\" source=\"000076\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"288\" source=\"000074\" target=\"000033\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"287\" source=\"000081\" target=\"000038\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"286\" source=\"000041\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"285\" source=\"000078\" target=\"000048\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"284\" source=\"000060\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"283\" source=\"000074\" target=\"000027\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"282\" source=\"000057\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"281\" source=\"000078\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"280\" source=\"000037\" target=\"000046\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"279\" source=\"000086\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"278\" source=\"000074\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"277\" source=\"000003\" target=\"000049\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"276\" source=\"000072\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"275\" source=\"000074\" target=\"000020\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"274\" source=\"000060\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"273\" source=\"000072\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"272\" source=\"000081\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"271\" source=\"000055\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"270\" source=\"000074\" target=\"000076\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"269\" source=\"000019\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"268\" source=\"000057\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"267\" source=\"000057\" target=\"000087\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"266\" source=\"000029\" target=\"000066\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"265\" source=\"000074\" target=\"000036\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"264\" source=\"000087\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"263\" source=\"000034\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"262\" source=\"000055\" target=\"000076\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"261\" source=\"000074\" target=\"000003\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"260\" source=\"000027\" target=\"000004\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"259\" source=\"000081\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"258\" source=\"000084\" target=\"000017\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"257\" source=\"000070\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"256\" source=\"000065\" target=\"000027\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"255\" source=\"000077\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"254\" source=\"000029\" target=\"000006\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"253\" source=\"000064\" target=\"000043\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"252\" source=\"000054\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"251\" source=\"000074\" target=\"000018\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"250\" source=\"000055\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"249\" source=\"000040\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"248\" source=\"000011\" target=\"000038\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"247\" source=\"000029\" target=\"000046\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"246\" source=\"000042\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"245\" source=\"000049\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"244\" source=\"000078\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"243\" source=\"000063\" target=\"000066\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"242\" source=\"000011\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"241\" source=\"000078\" target=\"000069\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"240\" source=\"000084\" target=\"000067\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"239\" source=\"000033\" target=\"000078\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"238\" source=\"000057\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"237\" source=\"000025\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"236\" source=\"000063\" target=\"000067\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"235\" source=\"000034\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"234\" source=\"000084\" target=\"000066\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"233\" source=\"000005\" target=\"000046\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"232\" source=\"000028\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"231\" source=\"000029\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"230\" source=\"000071\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"229\" source=\"000061\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"228\" source=\"000078\" target=\"000040\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"227\" source=\"000082\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"226\" source=\"000052\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"225\" source=\"000078\" target=\"000070\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"224\" source=\"000073\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"223\" source=\"000032\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"222\" source=\"000033\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"221\" source=\"000041\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"220\" source=\"000055\" target=\"000069\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"219\" source=\"000019\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"218\" source=\"000084\" target=\"000006\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"217\" source=\"000069\" target=\"000036\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"216\" source=\"000074\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"215\" source=\"000072\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"214\" source=\"000086\" target=\"000075\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"213\" source=\"000037\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"212\" source=\"000040\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"211\" source=\"000041\" target=\"000018\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"210\" source=\"000060\" target=\"000019\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"209\" source=\"000019\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"208\" source=\"000074\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"207\" source=\"000086\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"206\" source=\"000023\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"205\" source=\"000007\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"204\" source=\"000048\" target=\"000070\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"203\" source=\"000051\" target=\"000014\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"202\" source=\"000013\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"201\" source=\"000069\" target=\"000075\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"200\" source=\"000060\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"199\" source=\"000057\" target=\"000007\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"198\" source=\"000084\" target=\"000008\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"197\" source=\"000051\" target=\"000011\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"196\" source=\"000074\" target=\"000009\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"195\" source=\"000073\" target=\"000056\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"194\" source=\"000033\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"193\" source=\"000073\" target=\"000027\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"192\" source=\"000032\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"191\" source=\"000055\" target=\"000087\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"190\" source=\"000034\" target=\"000040\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"189\" source=\"000052\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"188\" source=\"000057\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"187\" source=\"000061\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"186\" source=\"000060\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"185\" source=\"000054\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"184\" source=\"000051\" target=\"000010\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"183\" source=\"000037\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"182\" source=\"000087\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"181\" source=\"000033\" target=\"000037\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"180\" source=\"000040\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"179\" source=\"000083\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"178\" source=\"000081\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"177\" source=\"000019\" target=\"000046\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"176\" source=\"000037\" target=\"000082\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"175\" source=\"000023\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"174\" source=\"000032\" target=\"000030\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"173\" source=\"000073\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"172\" source=\"000069\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"171\" source=\"000068\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"170\" source=\"000074\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"169\" source=\"000073\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"168\" source=\"000057\" target=\"000060\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"167\" source=\"000078\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"166\" source=\"000029\" target=\"000051\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"165\" source=\"000011\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"164\" source=\"000060\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"163\" source=\"000051\" target=\"000012\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"162\" source=\"000072\" target=\"000013\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"161\" source=\"000035\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"160\" source=\"000047\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"159\" source=\"000068\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"158\" source=\"000023\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"157\" source=\"000074\" target=\"000054\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"156\" source=\"000036\" target=\"000028\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"155\" source=\"000074\" target=\"000075\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"154\" source=\"000063\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"153\" source=\"000058\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"152\" source=\"000037\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"151\" source=\"000068\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"150\" source=\"000031\" target=\"000014\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"149\" source=\"000023\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"148\" source=\"000033\" target=\"000057\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"147\" source=\"000051\" target=\"000038\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"146\" source=\"000060\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"145\" source=\"000071\" target=\"000027\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"144\" source=\"000087\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"143\" source=\"000057\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"142\" source=\"000030\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"141\" source=\"000063\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"140\" source=\"000027\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"139\" source=\"000015\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"138\" source=\"000077\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"137\" source=\"000071\" target=\"000017\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"136\" source=\"000085\" target=\"000023\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"135\" source=\"000037\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"134\" source=\"000041\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"133\" source=\"000048\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"132\" source=\"000076\" target=\"000087\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"131\" source=\"000065\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"130\" source=\"000082\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"129\" source=\"000079\" target=\"000016\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"128\" source=\"000081\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"127\" source=\"000040\" target=\"000056\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"126\" source=\"000037\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"125\" source=\"000065\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"124\" source=\"000087\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"123\" source=\"000056\" target=\"000059\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"122\" source=\"000029\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"121\" source=\"000074\" target=\"000021\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"120\" source=\"000085\" target=\"000071\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"119\" source=\"000021\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"118\" source=\"000058\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"117\" source=\"000073\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"116\" source=\"000037\" target=\"000087\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"115\" source=\"000020\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"114\" source=\"000086\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"113\" source=\"000061\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"112\" source=\"000065\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"111\" source=\"000055\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"110\" source=\"000040\" target=\"000059\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"109\" source=\"000051\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"108\" source=\"000057\" target=\"000065\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"107\" source=\"000065\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"106\" source=\"000068\" target=\"000017\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"105\" source=\"000078\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"104\" source=\"000057\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"103\" source=\"000037\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"102\" source=\"000018\" target=\"000020\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"101\" source=\"000045\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"100\" source=\"000034\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"99\" source=\"000073\" target=\"000065\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"98\" source=\"000035\" target=\"000036\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"97\" source=\"000030\" target=\"000019\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"96\" source=\"000077\" target=\"000069\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"95\" source=\"000073\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"94\" source=\"000020\" target=\"000043\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"93\" source=\"000071\" target=\"000032\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"92\" source=\"000027\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"91\" source=\"000078\" target=\"000052\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"90\" source=\"000021\" target=\"000049\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"89\" source=\"000054\" target=\"000082\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"88\" source=\"000074\" target=\"000022\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"87\" source=\"000057\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"86\" source=\"000023\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"85\" source=\"000084\" target=\"000026\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"84\" source=\"000058\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"83\" source=\"000057\" target=\"000056\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"82\" source=\"000061\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"81\" source=\"000078\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"80\" source=\"000074\" target=\"000024\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"79\" source=\"000082\" target=\"000025\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"78\" source=\"000081\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"77\" source=\"000026\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"76\" source=\"000027\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"75\" source=\"000074\" target=\"000087\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"74\" source=\"000074\" target=\"000078\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"73\" source=\"000074\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"72\" source=\"000073\" target=\"000032\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"71\" source=\"000066\" target=\"000028\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"70\" source=\"000029\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"69\" source=\"000081\" target=\"000030\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"68\" source=\"000042\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"67\" source=\"000060\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"66\" source=\"000042\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"65\" source=\"000057\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"64\" source=\"000073\" target=\"000048\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"63\" source=\"000074\" target=\"000056\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"62\" source=\"000065\" target=\"000052\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"61\" source=\"000063\" target=\"000031\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"60\" source=\"000033\" target=\"000032\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"59\" source=\"000063\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"58\" source=\"000082\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"57\" source=\"000078\" target=\"000060\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"56\" source=\"000059\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"55\" source=\"000034\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"54\" source=\"000042\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"53\" source=\"000066\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"52\" source=\"000086\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"51\" source=\"000084\" target=\"000058\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"50\" source=\"000062\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"49\" source=\"000065\" target=\"000035\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"48\" source=\"000037\" target=\"000036\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"47\" source=\"000085\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"46\" source=\"000053\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"45\" source=\"000071\" target=\"000082\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"44\" source=\"000063\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"43\" source=\"000068\" target=\"000038\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"42\" source=\"000084\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"41\" source=\"000065\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"40\" source=\"000040\" target=\"000039\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"39\" source=\"000042\" target=\"000041\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"38\" source=\"000068\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"37\" source=\"000074\" target=\"000043\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"36\" source=\"000074\" target=\"000082\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"35\" source=\"000063\" target=\"000044\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"34\" source=\"000046\" target=\"000045\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"33\" source=\"000071\" target=\"000047\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"32\" source=\"000048\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"31\" source=\"000074\" target=\"000049\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"30\" source=\"000074\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"29\" source=\"000051\" target=\"000050\" directed=\"true\">\n\
  \    </edge>\n\
  \    <edge id=\"28\" source=\"000052\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"27\" source=\"000071\" target=\"000053\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"26\" source=\"000071\" target=\"000054\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"25\" source=\"000055\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"24\" source=\"000056\" target=\"000069\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"23\" source=\"000071\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"22\" source=\"000057\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"21\" source=\"000082\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"20\" source=\"000058\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"19\" source=\"000060\" target=\"000059\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"18\" source=\"000062\" target=\"000061\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"17\" source=\"000065\" target=\"000080\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"16\" source=\"000070\" target=\"000063\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"15\" source=\"000068\" target=\"000064\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"14\" source=\"000065\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"13\" source=\"000067\" target=\"000066\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"12\" source=\"000074\" target=\"000068\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"11\" source=\"000069\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"10\" source=\"000071\" target=\"000070\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"9\" source=\"000074\" target=\"000072\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"8\" source=\"000074\" target=\"000073\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"7\" source=\"000076\" target=\"000075\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"6\" source=\"000078\" target=\"000077\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"5\" source=\"000078\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"4\" source=\"000080\" target=\"000079\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"3\" source=\"000082\" target=\"000081\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"2\" source=\"000086\" target=\"000083\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"1\" source=\"000085\" target=\"000084\" directed=\"false\">\n\
  \    </edge>\n\
  \    <edge id=\"0\" source=\"000087\" target=\"000086\" directed=\"false\">\n\
  \    </edge>\n\
  \  </graph>\n\
  \</graphml>"

-- examples/graphs/n1/n1-sim-environment.vhdl
-- See note in header about literals
enviroFile1 :: String
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



-- examples/graphs/n2/n2-sim-environment.vhdl
-- See note near header about literals
enviroFile2 :: String
enviroFile2 =
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
  \\t\tEN_NODES\t: IN\tstd_logic_vector(86 downto 0);\n\
  \\t\tSTART\t: IN\tstd_logic;\n\
  \\t\tDIN\t: IN\tstd_logic;\n\
  \\t\tDONE\t: OUT\tstd_logic;\n\
  \\t\tCOMPLETE\t: OUT\tstd_logic;\n\
  \\t\tRESULT\t: OUT\tstd_logic_vector(14 downto 0));\n\
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
  \\t\t\tEN\t: IN\tstd_logic_vector(86 downto 0);\n\
  \\t\t\tDIN\t: IN\tstd_logic_vector(86 downto 0);\n\
  \\t\t\tDOUT\t: OUT\tstd_logic_vector(86 downto 0));\n\
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
  \\tSIGNAL in_network\t: std_logic_vector(87 downto 0);\n\
  \\tSIGNAL sync_in\t\t: std_logic_vector(86 downto 0);\n\
  \\tSIGNAL sync_out\t: std_logic_vector(86 downto 0);\n\
  \\tSIGNAL count\t\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL count_sum\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL count_mul\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL count_mul2\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL sum\t\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL sum_mul\t\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL sum_mul2\t\t: std_logic_vector(6 downto 0);\n\
  \\tSIGNAL mul\t\t: std_logic_vector(13 downto 0);\n\
  \\tSIGNAL start_del\t\t: std_logic;\n\
  \\tSIGNAL start_counting\t: std_logic;\n\
  \\tSIGNAL enable_reg_del\t: std_logic_vector(86 downto 0);\n\
  \\tSIGNAL done1, done2, done3, done_res\t\t: std_logic;\n\
  \\tSIGNAL res, res2\t\t: std_logic_vector(14 downto 0);\n\
  \\tSIGNAL comparator_en\t\t: std_logic;\n\
  \\n\
  \BEGIN\n\
  \\n\
  \\tDELAYER_ENABLE : for i in 0 to 86 generate\n\
  \\t\tenable_reg_del(i) <= EN_NODES(i) AND start_del;\n\
  \\tend generate;\n\
  \\n\
  \\tNETWORK : Graph\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> enable_reg_del,\n\
  \\t\t\tDIN\t=> in_network(86 downto 0),\n\
  \\t\t\tDOUT\t=> sync_in);\n\
  \\n\
  \\tSYNCHRONISER : Generic_sync_register\n\
  \\t\tGENERIC MAP(87)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> sync_in,\n\
  \\t\t\tDOUT\t=> sync_out);\n\
  \\n\
  \\tCOUNTER : Generic_counter\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> start_counting,\n\
  \\t\t\tDOUT\t=> count);\n\
  \\n\
  \\tREG_COUNTER : Generic_register\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> count,\n\
  \\t\t\tDOUT\t=> count_sum);\n\
  \\n\
  \\tACCUMULATOR : Generic_accumulator\n\
  \\t\tGENERIC MAP(14)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> start_del,\n\
  \\t\t\tDIN\t=> mul,\n\
  \\t\t\tDOUT\t=> res);\n\
  \\n\
  \\tREG_COUNTER_MUL : Generic_register\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> count_sum,\n\
  \\t\t\tDOUT\t=> count_mul);\n\
  \\n\
  \\tREG_COUNTER_MUL2 : Generic_register\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> count_mul,\n\
  \\t\t\tDOUT\t=> count_mul2);\n\
  \\n\
  \\tREG_SUM_MUL : Generic_register\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> sum,\n\
  \\t\t\tDOUT\t=> sum_mul);\n\
  \\n\
  \\tREG_SUM_MUL2 : Generic_register\n\
  \\t\tGENERIC MAP(7)\n\
  \\t\tPORT MAP(\n\
  \\t\t\tCLK\t=> CLK,\n\
  \\t\t\tRST\t=> RST,\n\
  \\t\t\tEN\t=> EN,\n\
  \\t\t\tDIN\t=> sum_mul,\n\
  \\t\t\tDOUT\t=> sum_mul2);\n\
  \\n\
  \\tSHIFT_REG : Generic_shift_register_input\n\
  \\t\tGENERIC MAP(88)\n\
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
  \\t\tGENERIC MAP(7)\n\
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
  \\tCOMPLETE <= in_network(87);\n\
  \\n\
  \\tsum <= \t\t(\"000000\" & sync_out(86))\t+\n\
  \\t\t(\"000000\" & sync_out(85))\t+\n\
  \\t\t(\"000000\" & sync_out(84))\t+\n\
  \\t\t(\"000000\" & sync_out(83))\t+\n\
  \\t\t(\"000000\" & sync_out(82))\t+\n\
  \\t\t(\"000000\" & sync_out(81))\t+\n\
  \\t\t(\"000000\" & sync_out(80))\t+\n\
  \\t\t(\"000000\" & sync_out(79))\t+\n\
  \\t\t(\"000000\" & sync_out(78))\t+\n\
  \\t\t(\"000000\" & sync_out(77))\t+\n\
  \\t\t(\"000000\" & sync_out(76))\t+\n\
  \\t\t(\"000000\" & sync_out(75))\t+\n\
  \\t\t(\"000000\" & sync_out(74))\t+\n\
  \\t\t(\"000000\" & sync_out(73))\t+\n\
  \\t\t(\"000000\" & sync_out(72))\t+\n\
  \\t\t(\"000000\" & sync_out(71))\t+\n\
  \\t\t(\"000000\" & sync_out(70))\t+\n\
  \\t\t(\"000000\" & sync_out(69))\t+\n\
  \\t\t(\"000000\" & sync_out(68))\t+\n\
  \\t\t(\"000000\" & sync_out(67))\t+\n\
  \\t\t(\"000000\" & sync_out(66))\t+\n\
  \\t\t(\"000000\" & sync_out(65))\t+\n\
  \\t\t(\"000000\" & sync_out(64))\t+\n\
  \\t\t(\"000000\" & sync_out(63))\t+\n\
  \\t\t(\"000000\" & sync_out(62))\t+\n\
  \\t\t(\"000000\" & sync_out(61))\t+\n\
  \\t\t(\"000000\" & sync_out(60))\t+\n\
  \\t\t(\"000000\" & sync_out(59))\t+\n\
  \\t\t(\"000000\" & sync_out(58))\t+\n\
  \\t\t(\"000000\" & sync_out(57))\t+\n\
  \\t\t(\"000000\" & sync_out(56))\t+\n\
  \\t\t(\"000000\" & sync_out(55))\t+\n\
  \\t\t(\"000000\" & sync_out(54))\t+\n\
  \\t\t(\"000000\" & sync_out(53))\t+\n\
  \\t\t(\"000000\" & sync_out(52))\t+\n\
  \\t\t(\"000000\" & sync_out(51))\t+\n\
  \\t\t(\"000000\" & sync_out(50))\t+\n\
  \\t\t(\"000000\" & sync_out(49))\t+\n\
  \\t\t(\"000000\" & sync_out(48))\t+\n\
  \\t\t(\"000000\" & sync_out(47))\t+\n\
  \\t\t(\"000000\" & sync_out(46))\t+\n\
  \\t\t(\"000000\" & sync_out(45))\t+\n\
  \\t\t(\"000000\" & sync_out(44))\t+\n\
  \\t\t(\"000000\" & sync_out(43))\t+\n\
  \\t\t(\"000000\" & sync_out(42))\t+\n\
  \\t\t(\"000000\" & sync_out(41))\t+\n\
  \\t\t(\"000000\" & sync_out(40))\t+\n\
  \\t\t(\"000000\" & sync_out(39))\t+\n\
  \\t\t(\"000000\" & sync_out(38))\t+\n\
  \\t\t(\"000000\" & sync_out(37))\t+\n\
  \\t\t(\"000000\" & sync_out(36))\t+\n\
  \\t\t(\"000000\" & sync_out(35))\t+\n\
  \\t\t(\"000000\" & sync_out(34))\t+\n\
  \\t\t(\"000000\" & sync_out(33))\t+\n\
  \\t\t(\"000000\" & sync_out(32))\t+\n\
  \\t\t(\"000000\" & sync_out(31))\t+\n\
  \\t\t(\"000000\" & sync_out(30))\t+\n\
  \\t\t(\"000000\" & sync_out(29))\t+\n\
  \\t\t(\"000000\" & sync_out(28))\t+\n\
  \\t\t(\"000000\" & sync_out(27))\t+\n\
  \\t\t(\"000000\" & sync_out(26))\t+\n\
  \\t\t(\"000000\" & sync_out(25))\t+\n\
  \\t\t(\"000000\" & sync_out(24))\t+\n\
  \\t\t(\"000000\" & sync_out(23))\t+\n\
  \\t\t(\"000000\" & sync_out(22))\t+\n\
  \\t\t(\"000000\" & sync_out(21))\t+\n\
  \\t\t(\"000000\" & sync_out(20))\t+\n\
  \\t\t(\"000000\" & sync_out(19))\t+\n\
  \\t\t(\"000000\" & sync_out(18))\t+\n\
  \\t\t(\"000000\" & sync_out(17))\t+\n\
  \\t\t(\"000000\" & sync_out(16))\t+\n\
  \\t\t(\"000000\" & sync_out(15))\t+\n\
  \\t\t(\"000000\" & sync_out(14))\t+\n\
  \\t\t(\"000000\" & sync_out(13))\t+\n\
  \\t\t(\"000000\" & sync_out(12))\t+\n\
  \\t\t(\"000000\" & sync_out(11))\t+\n\
  \\t\t(\"000000\" & sync_out(10))\t+\n\
  \\t\t(\"000000\" & sync_out(9))\t+\n\
  \\t\t(\"000000\" & sync_out(8))\t+\n\
  \\t\t(\"000000\" & sync_out(7))\t+\n\
  \\t\t(\"000000\" & sync_out(6))\t+\n\
  \\t\t(\"000000\" & sync_out(5))\t+\n\
  \\t\t(\"000000\" & sync_out(4))\t+\n\
  \\t\t(\"000000\" & sync_out(3))\t+\n\
  \\t\t(\"000000\" & sync_out(2))\t+\n\
  \\t\t(\"000000\" & sync_out(1))\t+\n\
  \\t\t(\"000000\" & sync_out(0));\n\
  \\n\
  \\tmul <= sum_mul2 * count_mul2;\n\
  \\n\
  \\n\
  \END test;"


-- examples/graphs/n1/n1-graph.vhdl
-- See note near header about literals
vhdlGraph1 :: String
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


-- examples/graphs/n2/n2-graph.vhdl
-- See note near header about literals
vhdlGraph2 :: String
vhdlGraph2 =
  "-- Nodes: 87 - Edges: 404\n\
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
  \\t\tEN\t: IN\tstd_logic_vector(86 downto 0);\n\
  \\t\tDIN\t: IN\tstd_logic_vector(86 downto 0);\n\
  \\t\tDOUT\t: OUT\tstd_logic_vector(86 downto 0));\n\
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
  \\tSIGNAL data_in  : STD_LOGIC_VECTOR(86 downto 0);\n\
  \\tSIGNAL data_out : STD_LOGIC_VECTOR(86 downto 0);\n\
  \\n\
  \BEGIN\n\
  \\n\
  \\t-- Registers\n\
  \\tREG_000001 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(0),\n\
  \\t\tD\t=>\tdata_in(0),\n\
  \\t\tQ\t=>\tdata_out(0));\n\
  \\tREG_000002 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(1),\n\
  \\t\tD\t=>\tdata_in(1),\n\
  \\t\tQ\t=>\tdata_out(1));\n\
  \\tREG_000003 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(2),\n\
  \\t\tD\t=>\tdata_in(2),\n\
  \\t\tQ\t=>\tdata_out(2));\n\
  \\tREG_000004 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(3),\n\
  \\t\tD\t=>\tdata_in(3),\n\
  \\t\tQ\t=>\tdata_out(3));\n\
  \\tREG_000005 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(4),\n\
  \\t\tD\t=>\tdata_in(4),\n\
  \\t\tQ\t=>\tdata_out(4));\n\
  \\tREG_000006 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(5),\n\
  \\t\tD\t=>\tdata_in(5),\n\
  \\t\tQ\t=>\tdata_out(5));\n\
  \\tREG_000007 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(6),\n\
  \\t\tD\t=>\tdata_in(6),\n\
  \\t\tQ\t=>\tdata_out(6));\n\
  \\tREG_000008 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(7),\n\
  \\t\tD\t=>\tdata_in(7),\n\
  \\t\tQ\t=>\tdata_out(7));\n\
  \\tREG_000009 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(8),\n\
  \\t\tD\t=>\tdata_in(8),\n\
  \\t\tQ\t=>\tdata_out(8));\n\
  \\tREG_000010 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(9),\n\
  \\t\tD\t=>\tdata_in(9),\n\
  \\t\tQ\t=>\tdata_out(9));\n\
  \\tREG_000011 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(10),\n\
  \\t\tD\t=>\tdata_in(10),\n\
  \\t\tQ\t=>\tdata_out(10));\n\
  \\tREG_000012 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(11),\n\
  \\t\tD\t=>\tdata_in(11),\n\
  \\t\tQ\t=>\tdata_out(11));\n\
  \\tREG_000013 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(12),\n\
  \\t\tD\t=>\tdata_in(12),\n\
  \\t\tQ\t=>\tdata_out(12));\n\
  \\tREG_000014 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(13),\n\
  \\t\tD\t=>\tdata_in(13),\n\
  \\t\tQ\t=>\tdata_out(13));\n\
  \\tREG_000015 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(14),\n\
  \\t\tD\t=>\tdata_in(14),\n\
  \\t\tQ\t=>\tdata_out(14));\n\
  \\tREG_000016 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(15),\n\
  \\t\tD\t=>\tdata_in(15),\n\
  \\t\tQ\t=>\tdata_out(15));\n\
  \\tREG_000017 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(16),\n\
  \\t\tD\t=>\tdata_in(16),\n\
  \\t\tQ\t=>\tdata_out(16));\n\
  \\tREG_000018 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(17),\n\
  \\t\tD\t=>\tdata_in(17),\n\
  \\t\tQ\t=>\tdata_out(17));\n\
  \\tREG_000019 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(18),\n\
  \\t\tD\t=>\tdata_in(18),\n\
  \\t\tQ\t=>\tdata_out(18));\n\
  \\tREG_000020 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(19),\n\
  \\t\tD\t=>\tdata_in(19),\n\
  \\t\tQ\t=>\tdata_out(19));\n\
  \\tREG_000021 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(20),\n\
  \\t\tD\t=>\tdata_in(20),\n\
  \\t\tQ\t=>\tdata_out(20));\n\
  \\tREG_000022 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(21),\n\
  \\t\tD\t=>\tdata_in(21),\n\
  \\t\tQ\t=>\tdata_out(21));\n\
  \\tREG_000023 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(22),\n\
  \\t\tD\t=>\tdata_in(22),\n\
  \\t\tQ\t=>\tdata_out(22));\n\
  \\tREG_000024 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(23),\n\
  \\t\tD\t=>\tdata_in(23),\n\
  \\t\tQ\t=>\tdata_out(23));\n\
  \\tREG_000025 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(24),\n\
  \\t\tD\t=>\tdata_in(24),\n\
  \\t\tQ\t=>\tdata_out(24));\n\
  \\tREG_000026 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(25),\n\
  \\t\tD\t=>\tdata_in(25),\n\
  \\t\tQ\t=>\tdata_out(25));\n\
  \\tREG_000027 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(26),\n\
  \\t\tD\t=>\tdata_in(26),\n\
  \\t\tQ\t=>\tdata_out(26));\n\
  \\tREG_000028 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(27),\n\
  \\t\tD\t=>\tdata_in(27),\n\
  \\t\tQ\t=>\tdata_out(27));\n\
  \\tREG_000029 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(28),\n\
  \\t\tD\t=>\tdata_in(28),\n\
  \\t\tQ\t=>\tdata_out(28));\n\
  \\tREG_000030 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(29),\n\
  \\t\tD\t=>\tdata_in(29),\n\
  \\t\tQ\t=>\tdata_out(29));\n\
  \\tREG_000031 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(30),\n\
  \\t\tD\t=>\tdata_in(30),\n\
  \\t\tQ\t=>\tdata_out(30));\n\
  \\tREG_000032 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(31),\n\
  \\t\tD\t=>\tdata_in(31),\n\
  \\t\tQ\t=>\tdata_out(31));\n\
  \\tREG_000033 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(32),\n\
  \\t\tD\t=>\tdata_in(32),\n\
  \\t\tQ\t=>\tdata_out(32));\n\
  \\tREG_000034 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(33),\n\
  \\t\tD\t=>\tdata_in(33),\n\
  \\t\tQ\t=>\tdata_out(33));\n\
  \\tREG_000035 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(34),\n\
  \\t\tD\t=>\tdata_in(34),\n\
  \\t\tQ\t=>\tdata_out(34));\n\
  \\tREG_000036 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(35),\n\
  \\t\tD\t=>\tdata_in(35),\n\
  \\t\tQ\t=>\tdata_out(35));\n\
  \\tREG_000037 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(36),\n\
  \\t\tD\t=>\tdata_in(36),\n\
  \\t\tQ\t=>\tdata_out(36));\n\
  \\tREG_000038 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(37),\n\
  \\t\tD\t=>\tdata_in(37),\n\
  \\t\tQ\t=>\tdata_out(37));\n\
  \\tREG_000039 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(38),\n\
  \\t\tD\t=>\tdata_in(38),\n\
  \\t\tQ\t=>\tdata_out(38));\n\
  \\tREG_000040 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(39),\n\
  \\t\tD\t=>\tdata_in(39),\n\
  \\t\tQ\t=>\tdata_out(39));\n\
  \\tREG_000041 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(40),\n\
  \\t\tD\t=>\tdata_in(40),\n\
  \\t\tQ\t=>\tdata_out(40));\n\
  \\tREG_000042 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(41),\n\
  \\t\tD\t=>\tdata_in(41),\n\
  \\t\tQ\t=>\tdata_out(41));\n\
  \\tREG_000043 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(42),\n\
  \\t\tD\t=>\tdata_in(42),\n\
  \\t\tQ\t=>\tdata_out(42));\n\
  \\tREG_000044 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(43),\n\
  \\t\tD\t=>\tdata_in(43),\n\
  \\t\tQ\t=>\tdata_out(43));\n\
  \\tREG_000045 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(44),\n\
  \\t\tD\t=>\tdata_in(44),\n\
  \\t\tQ\t=>\tdata_out(44));\n\
  \\tREG_000046 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(45),\n\
  \\t\tD\t=>\tdata_in(45),\n\
  \\t\tQ\t=>\tdata_out(45));\n\
  \\tREG_000047 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(46),\n\
  \\t\tD\t=>\tdata_in(46),\n\
  \\t\tQ\t=>\tdata_out(46));\n\
  \\tREG_000048 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(47),\n\
  \\t\tD\t=>\tdata_in(47),\n\
  \\t\tQ\t=>\tdata_out(47));\n\
  \\tREG_000049 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(48),\n\
  \\t\tD\t=>\tdata_in(48),\n\
  \\t\tQ\t=>\tdata_out(48));\n\
  \\tREG_000050 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(49),\n\
  \\t\tD\t=>\tdata_in(49),\n\
  \\t\tQ\t=>\tdata_out(49));\n\
  \\tREG_000051 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(50),\n\
  \\t\tD\t=>\tdata_in(50),\n\
  \\t\tQ\t=>\tdata_out(50));\n\
  \\tREG_000052 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(51),\n\
  \\t\tD\t=>\tdata_in(51),\n\
  \\t\tQ\t=>\tdata_out(51));\n\
  \\tREG_000053 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(52),\n\
  \\t\tD\t=>\tdata_in(52),\n\
  \\t\tQ\t=>\tdata_out(52));\n\
  \\tREG_000054 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(53),\n\
  \\t\tD\t=>\tdata_in(53),\n\
  \\t\tQ\t=>\tdata_out(53));\n\
  \\tREG_000055 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(54),\n\
  \\t\tD\t=>\tdata_in(54),\n\
  \\t\tQ\t=>\tdata_out(54));\n\
  \\tREG_000056 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(55),\n\
  \\t\tD\t=>\tdata_in(55),\n\
  \\t\tQ\t=>\tdata_out(55));\n\
  \\tREG_000057 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(56),\n\
  \\t\tD\t=>\tdata_in(56),\n\
  \\t\tQ\t=>\tdata_out(56));\n\
  \\tREG_000058 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(57),\n\
  \\t\tD\t=>\tdata_in(57),\n\
  \\t\tQ\t=>\tdata_out(57));\n\
  \\tREG_000059 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(58),\n\
  \\t\tD\t=>\tdata_in(58),\n\
  \\t\tQ\t=>\tdata_out(58));\n\
  \\tREG_000060 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(59),\n\
  \\t\tD\t=>\tdata_in(59),\n\
  \\t\tQ\t=>\tdata_out(59));\n\
  \\tREG_000061 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(60),\n\
  \\t\tD\t=>\tdata_in(60),\n\
  \\t\tQ\t=>\tdata_out(60));\n\
  \\tREG_000062 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(61),\n\
  \\t\tD\t=>\tdata_in(61),\n\
  \\t\tQ\t=>\tdata_out(61));\n\
  \\tREG_000063 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(62),\n\
  \\t\tD\t=>\tdata_in(62),\n\
  \\t\tQ\t=>\tdata_out(62));\n\
  \\tREG_000064 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(63),\n\
  \\t\tD\t=>\tdata_in(63),\n\
  \\t\tQ\t=>\tdata_out(63));\n\
  \\tREG_000065 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(64),\n\
  \\t\tD\t=>\tdata_in(64),\n\
  \\t\tQ\t=>\tdata_out(64));\n\
  \\tREG_000066 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(65),\n\
  \\t\tD\t=>\tdata_in(65),\n\
  \\t\tQ\t=>\tdata_out(65));\n\
  \\tREG_000067 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(66),\n\
  \\t\tD\t=>\tdata_in(66),\n\
  \\t\tQ\t=>\tdata_out(66));\n\
  \\tREG_000068 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(67),\n\
  \\t\tD\t=>\tdata_in(67),\n\
  \\t\tQ\t=>\tdata_out(67));\n\
  \\tREG_000069 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(68),\n\
  \\t\tD\t=>\tdata_in(68),\n\
  \\t\tQ\t=>\tdata_out(68));\n\
  \\tREG_000070 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(69),\n\
  \\t\tD\t=>\tdata_in(69),\n\
  \\t\tQ\t=>\tdata_out(69));\n\
  \\tREG_000071 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(70),\n\
  \\t\tD\t=>\tdata_in(70),\n\
  \\t\tQ\t=>\tdata_out(70));\n\
  \\tREG_000072 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(71),\n\
  \\t\tD\t=>\tdata_in(71),\n\
  \\t\tQ\t=>\tdata_out(71));\n\
  \\tREG_000073 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(72),\n\
  \\t\tD\t=>\tdata_in(72),\n\
  \\t\tQ\t=>\tdata_out(72));\n\
  \\tREG_000074 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(73),\n\
  \\t\tD\t=>\tdata_in(73),\n\
  \\t\tQ\t=>\tdata_out(73));\n\
  \\tREG_000075 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(74),\n\
  \\t\tD\t=>\tdata_in(74),\n\
  \\t\tQ\t=>\tdata_out(74));\n\
  \\tREG_000076 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(75),\n\
  \\t\tD\t=>\tdata_in(75),\n\
  \\t\tQ\t=>\tdata_out(75));\n\
  \\tREG_000077 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(76),\n\
  \\t\tD\t=>\tdata_in(76),\n\
  \\t\tQ\t=>\tdata_out(76));\n\
  \\tREG_000078 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(77),\n\
  \\t\tD\t=>\tdata_in(77),\n\
  \\t\tQ\t=>\tdata_out(77));\n\
  \\tREG_000079 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(78),\n\
  \\t\tD\t=>\tdata_in(78),\n\
  \\t\tQ\t=>\tdata_out(78));\n\
  \\tREG_000080 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(79),\n\
  \\t\tD\t=>\tdata_in(79),\n\
  \\t\tQ\t=>\tdata_out(79));\n\
  \\tREG_000081 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(80),\n\
  \\t\tD\t=>\tdata_in(80),\n\
  \\t\tQ\t=>\tdata_out(80));\n\
  \\tREG_000082 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(81),\n\
  \\t\tD\t=>\tdata_in(81),\n\
  \\t\tQ\t=>\tdata_out(81));\n\
  \\tREG_000083 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(82),\n\
  \\t\tD\t=>\tdata_in(82),\n\
  \\t\tQ\t=>\tdata_out(82));\n\
  \\tREG_000084 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(83),\n\
  \\t\tD\t=>\tdata_in(83),\n\
  \\t\tQ\t=>\tdata_out(83));\n\
  \\tREG_000085 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(84),\n\
  \\t\tD\t=>\tdata_in(84),\n\
  \\t\tQ\t=>\tdata_out(84));\n\
  \\tREG_000086 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(85),\n\
  \\t\tD\t=>\tdata_in(85),\n\
  \\t\tQ\t=>\tdata_out(85));\n\
  \\tREG_000087 : ffd PORT MAP (\n\
  \\t\tCLK\t=>\tCLK,\n\
  \\t\tRST\t=>\tRST,\n\
  \\t\tEN\t=>\tEN(86),\n\
  \\t\tD\t=>\tdata_in(86),\n\
  \\t\tQ\t=>\tdata_out(86));\n\
  \\n\
  \\t-- Wire connections: inputs\n\
  \\tdata_in(0) <=\tDIN(0)\n\
  \\t\t\tOR data_out(50);\n\
  \\tdata_in(1) <=\tDIN(1)\n\
  \\t\t\tOR data_out(50);\n\
  \\tdata_in(2) <=\tDIN(2)\n\
  \\t\t\tOR data_out(48)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(3) <=\tDIN(3)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(26);\n\
  \\tdata_in(4) <=\tDIN(4)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(45);\n\
  \\tdata_in(5) <=\tDIN(5)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(83);\n\
  \\tdata_in(6) <=\tDIN(6)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(56);\n\
  \\tdata_in(7) <=\tDIN(7)\n\
  \\t\t\tOR data_out(83);\n\
  \\tdata_in(8) <=\tDIN(8)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(9) <=\tDIN(9)\n\
  \\t\t\tOR data_out(50);\n\
  \\tdata_in(10) <=\tDIN(10)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(37)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(15);\n\
  \\tdata_in(11) <=\tDIN(11)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(50);\n\
  \\tdata_in(12) <=\tDIN(12)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(20)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(27)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(71);\n\
  \\tdata_in(13) <=\tDIN(13)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(30);\n\
  \\tdata_in(14) <=\tDIN(14)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(83);\n\
  \\tdata_in(15) <=\tDIN(15)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(20)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(48)\n\
  \\t\t\tOR data_out(27)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(78);\n\
  \\tdata_in(16) <=\tDIN(16)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(67);\n\
  \\tdata_in(17) <=\tDIN(17)\n\
  \\t\t\tOR data_out(42)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(19);\n\
  \\tdata_in(18) <=\tDIN(18)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(45)\n\
  \\t\t\tOR data_out(29);\n\
  \\tdata_in(19) <=\tDIN(19)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(17)\n\
  \\t\t\tOR data_out(42);\n\
  \\tdata_in(20) <=\tDIN(20)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(48);\n\
  \\tdata_in(21) <=\tDIN(21)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(22) <=\tDIN(22)\n\
  \\t\t\tOR data_out(58)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(84)\n\
  \\t\t\tOR data_out(52);\n\
  \\tdata_in(23) <=\tDIN(23)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(24) <=\tDIN(24)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(19)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(20)\n\
  \\t\t\tOR data_out(81);\n\
  \\tdata_in(25) <=\tDIN(25)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(38);\n\
  \\tdata_in(26) <=\tDIN(26)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(69)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(3)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(46);\n\
  \\tdata_in(27) <=\tDIN(27)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(35)\n\
  \\t\t\tOR data_out(65);\n\
  \\tdata_in(28) <=\tDIN(28)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(65)\n\
  \\t\t\tOR data_out(5)\n\
  \\t\t\tOR data_out(45)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(78);\n\
  \\tdata_in(29) <=\tDIN(29)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(80);\n\
  \\tdata_in(30) <=\tDIN(30)\n\
  \\t\t\tOR data_out(13)\n\
  \\t\t\tOR data_out(62);\n\
  \\tdata_in(31) <=\tDIN(31)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(4)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(32);\n\
  \\tdata_in(32) <=\tDIN(32)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(31);\n\
  \\tdata_in(33) <=\tDIN(33)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(72);\n\
  \\tdata_in(34) <=\tDIN(34)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(35)\n\
  \\t\t\tOR data_out(64);\n\
  \\tdata_in(35) <=\tDIN(35)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(27)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(36);\n\
  \\tdata_in(36) <=\tDIN(36)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(45)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(35);\n\
  \\tdata_in(37) <=\tDIN(37)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(67);\n\
  \\tdata_in(38) <=\tDIN(38)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(19)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(39);\n\
  \\tdata_in(39) <=\tDIN(39)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(58)\n\
  \\t\t\tOR data_out(38);\n\
  \\tdata_in(40) <=\tDIN(40)\n\
  \\t\t\tOR data_out(16)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(17)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(41);\n\
  \\tdata_in(41) <=\tDIN(41)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(40);\n\
  \\tdata_in(42) <=\tDIN(42)\n\
  \\t\t\tOR data_out(17)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(19)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(43) <=\tDIN(43)\n\
  \\t\t\tOR data_out(62);\n\
  \\tdata_in(44) <=\tDIN(44)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(82)\n\
  \\t\t\tOR data_out(45);\n\
  \\tdata_in(45) <=\tDIN(45)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(4)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(44);\n\
  \\tdata_in(46) <=\tDIN(46)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(69)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(70);\n\
  \\tdata_in(47) <=\tDIN(47)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(69)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(63);\n\
  \\tdata_in(48) <=\tDIN(48)\n\
  \\t\t\tOR data_out(2)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(20)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(49) <=\tDIN(49)\n\
  \\t\t\tOR data_out(50);\n\
  \\tdata_in(50) <=\tDIN(50)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(0)\n\
  \\t\t\tOR data_out(1)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(13)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(9)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(11)\n\
  \\t\t\tOR data_out(37)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(49);\n\
  \\tdata_in(51) <=\tDIN(51)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(63);\n\
  \\tdata_in(52) <=\tDIN(52)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(70);\n\
  \\tdata_in(53) <=\tDIN(53)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(70);\n\
  \\tdata_in(54) <=\tDIN(54)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(71);\n\
  \\tdata_in(55) <=\tDIN(55)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(58)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(68);\n\
  \\tdata_in(56) <=\tDIN(56)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(8)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(6)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(67);\n\
  \\tdata_in(57) <=\tDIN(57)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(41)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(60);\n\
  \\tdata_in(58) <=\tDIN(58)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(59);\n\
  \\tdata_in(59) <=\tDIN(59)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(11)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(58);\n\
  \\tdata_in(60) <=\tDIN(60)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(16)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(41)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(61);\n\
  \\tdata_in(61) <=\tDIN(61)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(60);\n\
  \\tdata_in(62) <=\tDIN(62)\n\
  \\t\t\tOR data_out(58)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(4)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(65)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(30)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(61)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(43)\n\
  \\t\t\tOR data_out(69);\n\
  \\tdata_in(63) <=\tDIN(63)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(42)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(82)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(67);\n\
  \\tdata_in(64) <=\tDIN(64)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(44)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(82);\n\
  \\tdata_in(65) <=\tDIN(65)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(27)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(66);\n\
  \\tdata_in(66) <=\tDIN(66)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(14)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(65);\n\
  \\tdata_in(67) <=\tDIN(67)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(16)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(37)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(68) <=\tDIN(68)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(35)\n\
  \\t\t\tOR data_out(74)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(82);\n\
  \\tdata_in(69) <=\tDIN(69)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(70);\n\
  \\tdata_in(70) <=\tDIN(70)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(16)\n\
  \\t\t\tOR data_out(84)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(69);\n\
  \\tdata_in(71) <=\tDIN(71)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(72) <=\tDIN(72)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(73);\n\
  \\tdata_in(73) <=\tDIN(73)\n\
  \\t\t\tOR data_out(3)\n\
  \\t\t\tOR data_out(27)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(34)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(19)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(35)\n\
  \\t\t\tOR data_out(2)\n\
  \\t\t\tOR data_out(17)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(8)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(74)\n\
  \\t\t\tOR data_out(20)\n\
  \\t\t\tOR data_out(21)\n\
  \\t\t\tOR data_out(23)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(55)\n\
  \\t\t\tOR data_out(42)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(48)\n\
  \\t\t\tOR data_out(82)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(72);\n\
  \\tdata_in(74) <=\tDIN(74)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(75);\n\
  \\tdata_in(75) <=\tDIN(75)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(19)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(74);\n\
  \\tdata_in(76) <=\tDIN(76)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(77);\n\
  \\tdata_in(77) <=\tDIN(77)\n\
  \\t\t\tOR data_out(84)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(69)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(80);\n\
  \\tdata_in(78) <=\tDIN(78)\n\
  \\t\t\tOR data_out(82)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(83)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(58)\n\
  \\t\t\tOR data_out(79);\n\
  \\tdata_in(79) <=\tDIN(79)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(74)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(15)\n\
  \\t\t\tOR data_out(50)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(32)\n\
  \\t\t\tOR data_out(86)\n\
  \\t\t\tOR data_out(46)\n\
  \\t\t\tOR data_out(26)\n\
  \\t\t\tOR data_out(41)\n\
  \\t\t\tOR data_out(65)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(78);\n\
  \\tdata_in(80) <=\tDIN(80)\n\
  \\t\t\tOR data_out(31)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(11)\n\
  \\t\t\tOR data_out(10)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(37)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(40)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(18)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(12)\n\
  \\t\t\tOR data_out(62)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(33)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(29)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(84)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(81);\n\
  \\tdata_in(81) <=\tDIN(81)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(85)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(76)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(80);\n\
  \\tdata_in(82) <=\tDIN(82)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(63)\n\
  \\t\t\tOR data_out(44)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(64)\n\
  \\t\t\tOR data_out(68)\n\
  \\t\t\tOR data_out(85);\n\
  \\tdata_in(83) <=\tDIN(83)\n\
  \\t\t\tOR data_out(47)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(16)\n\
  \\t\t\tOR data_out(41)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(65)\n\
  \\t\t\tOR data_out(28)\n\
  \\t\t\tOR data_out(5)\n\
  \\t\t\tOR data_out(7)\n\
  \\t\t\tOR data_out(51)\n\
  \\t\t\tOR data_out(14)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(57)\n\
  \\t\t\tOR data_out(60)\n\
  \\t\t\tOR data_out(84);\n\
  \\tdata_in(84) <=\tDIN(84)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(70)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(83);\n\
  \\tdata_in(85) <=\tDIN(85)\n\
  \\t\t\tOR data_out(66)\n\
  \\t\t\tOR data_out(80)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(81)\n\
  \\t\t\tOR data_out(22)\n\
  \\t\t\tOR data_out(77)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(39)\n\
  \\t\t\tOR data_out(74)\n\
  \\t\t\tOR data_out(52)\n\
  \\t\t\tOR data_out(53)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(72)\n\
  \\t\t\tOR data_out(78)\n\
  \\t\t\tOR data_out(59)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(82)\n\
  \\t\t\tOR data_out(86);\n\
  \\tdata_in(86) <=\tDIN(86)\n\
  \\t\t\tOR data_out(71)\n\
  \\t\t\tOR data_out(25)\n\
  \\t\t\tOR data_out(56)\n\
  \\t\t\tOR data_out(38)\n\
  \\t\t\tOR data_out(54)\n\
  \\t\t\tOR data_out(79)\n\
  \\t\t\tOR data_out(67)\n\
  \\t\t\tOR data_out(75)\n\
  \\t\t\tOR data_out(24)\n\
  \\t\t\tOR data_out(36)\n\
  \\t\t\tOR data_out(73)\n\
  \\t\t\tOR data_out(85);\n\
  \\n\
  \\t-- Wire connections: outputs\n\
  \\tDOUT(86) <= data_out(86);\n\
  \\tDOUT(85) <= data_out(85);\n\
  \\tDOUT(84) <= data_out(84);\n\
  \\tDOUT(83) <= data_out(83);\n\
  \\tDOUT(82) <= data_out(82);\n\
  \\tDOUT(81) <= data_out(81);\n\
  \\tDOUT(80) <= data_out(80);\n\
  \\tDOUT(79) <= data_out(79);\n\
  \\tDOUT(78) <= data_out(78);\n\
  \\tDOUT(77) <= data_out(77);\n\
  \\tDOUT(76) <= data_out(76);\n\
  \\tDOUT(75) <= data_out(75);\n\
  \\tDOUT(74) <= data_out(74);\n\
  \\tDOUT(73) <= data_out(73);\n\
  \\tDOUT(72) <= data_out(72);\n\
  \\tDOUT(71) <= data_out(71);\n\
  \\tDOUT(70) <= data_out(70);\n\
  \\tDOUT(69) <= data_out(69);\n\
  \\tDOUT(68) <= data_out(68);\n\
  \\tDOUT(67) <= data_out(67);\n\
  \\tDOUT(66) <= data_out(66);\n\
  \\tDOUT(65) <= data_out(65);\n\
  \\tDOUT(64) <= data_out(64);\n\
  \\tDOUT(63) <= data_out(63);\n\
  \\tDOUT(62) <= data_out(62);\n\
  \\tDOUT(61) <= data_out(61);\n\
  \\tDOUT(60) <= data_out(60);\n\
  \\tDOUT(59) <= data_out(59);\n\
  \\tDOUT(58) <= data_out(58);\n\
  \\tDOUT(57) <= data_out(57);\n\
  \\tDOUT(56) <= data_out(56);\n\
  \\tDOUT(55) <= data_out(55);\n\
  \\tDOUT(54) <= data_out(54);\n\
  \\tDOUT(53) <= data_out(53);\n\
  \\tDOUT(52) <= data_out(52);\n\
  \\tDOUT(51) <= data_out(51);\n\
  \\tDOUT(50) <= data_out(50);\n\
  \\tDOUT(49) <= data_out(49);\n\
  \\tDOUT(48) <= data_out(48);\n\
  \\tDOUT(47) <= data_out(47);\n\
  \\tDOUT(46) <= data_out(46);\n\
  \\tDOUT(45) <= data_out(45);\n\
  \\tDOUT(44) <= data_out(44);\n\
  \\tDOUT(43) <= data_out(43);\n\
  \\tDOUT(42) <= data_out(42);\n\
  \\tDOUT(41) <= data_out(41);\n\
  \\tDOUT(40) <= data_out(40);\n\
  \\tDOUT(39) <= data_out(39);\n\
  \\tDOUT(38) <= data_out(38);\n\
  \\tDOUT(37) <= data_out(37);\n\
  \\tDOUT(36) <= data_out(36);\n\
  \\tDOUT(35) <= data_out(35);\n\
  \\tDOUT(34) <= data_out(34);\n\
  \\tDOUT(33) <= data_out(33);\n\
  \\tDOUT(32) <= data_out(32);\n\
  \\tDOUT(31) <= data_out(31);\n\
  \\tDOUT(30) <= data_out(30);\n\
  \\tDOUT(29) <= data_out(29);\n\
  \\tDOUT(28) <= data_out(28);\n\
  \\tDOUT(27) <= data_out(27);\n\
  \\tDOUT(26) <= data_out(26);\n\
  \\tDOUT(25) <= data_out(25);\n\
  \\tDOUT(24) <= data_out(24);\n\
  \\tDOUT(23) <= data_out(23);\n\
  \\tDOUT(22) <= data_out(22);\n\
  \\tDOUT(21) <= data_out(21);\n\
  \\tDOUT(20) <= data_out(20);\n\
  \\tDOUT(19) <= data_out(19);\n\
  \\tDOUT(18) <= data_out(18);\n\
  \\tDOUT(17) <= data_out(17);\n\
  \\tDOUT(16) <= data_out(16);\n\
  \\tDOUT(15) <= data_out(15);\n\
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
