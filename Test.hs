module Main where

import Pangraph

main :: IO ()
main = do
  parseTest $head parseTests
  parseTest $parseTests !! 1
  putStrLn "*Parse tests passed."
  writeTest $ head writeTests
  writeTest $ writeTests !! 1
  putStrLn "*Write tests passed."
  where
    parseTests = zip parsePaths examples
    writeTests = zip writePaths examples
    parsePaths = map ("examples/"++) ["small.graphml", "model.xml"]
    writePaths =reverse ["temp1.graphml", "examples/temp2.graphml"]
    examples =cycle [ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
               ,ShortFile [ShortGraph [Node [Att ("id","v0")],Node [Att ("id","v1")],Node [Att ("id","v2")]] [Edge [Att ("id","con0"),Att ("source","v1"),Att ("target","v0")],Edge [Att ("id","con1"),Att ("source","v0"),Att ("target","v2")]]]]

parseTest::(String, ShortFile) -> IO()
parseTest(path, example) =do
    putStrLn $ "  Reading from: " ++ path
    file <- readGraph path []
    let result = parseGraph file
    if result /= example
      then
        error $ "Test failed on: " ++ show path
      else
        putStrLn $ "Test passed on: " ++ show path

writeTest::(String, ShortFile) -> IO()
writeTest (path, g)=do
  putStrLn $ "  Writing to: " ++ path
  writeGraph path g
  -- putStrLn ""
  parseTest (path, g)
