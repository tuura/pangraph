module Main where

import Pangraph

main :: IO ()
main = do
  putStrLn $ "*Parsing Test: " ++ show (length parseTests)
  parseTest $head parseTests
  parseTest $parseTests !! 1
  putStrLn "*Parse tests passed\n"
  putStrLn $ "*Writing Test: " ++ show (length writeTests)
  writeTest $ head writeTests
  writeTest $ writeTests !! 1
  writeTest $ writeTests !! 2
  putStrLn "*Write tests passed\n"
  putStrLn "*Big test"
  bigTest "examples/big.graphml"
  putStrLn "--------Tests Passed--------"
  where
    parseTests = zip parsePaths examples
    writeTests = zip writePaths examples
    parsePaths = map ("examples/"++) ["small.graphml", "model.xml"]
    writePaths =["temp1.graphml", "examples/temp2.graphml", "/examples/temp3.graphml"]
    examples =cycle [ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
               ,ShortFile [ShortGraph [Node [Att ("id","v0")],Node [Att ("id","v1")],Node [Att ("id","v2")]] [Edge [Att ("id","con0"),Att ("source","v1"),Att ("target","v0")],Edge [Att ("id","con1"),Att ("source","v0"),Att ("target","v2")]]]]

bigTest::String -> IO()
bigTest path=do
  putStrLn $ "  Reading from: " ++ path
  file <- readGraph path []
  let result =seq $ parseGraph file
  putStrLn $ "Test passed on: " ++ path

parseTest::(FilePath, ShortFile) -> IO()
parseTest(path, example) =do
  putStrLn $ "  Reading from: " ++ path
  file <- readGraph path []
  let result = parseGraph file
  if result /= example
    then
      error $ "Test failed on: " ++ show path
    else
      putStrLn $ "Test passed on: " ++ path

writeTest::(String, ShortFile) -> IO()
writeTest (path, g)=do
  putStrLn $ "  Writing to: " ++ path
  writeGraph path g
  -- putStrLn ""
  parseTest (path, g)
