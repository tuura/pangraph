module Main where

import Pangraph

main :: IO ()
main = do
  test $head tests
  test $tests !! 1
  putStrLn "All tests passed."
  where
    tests = zip paths examples
    paths = map ("examples/"++) ["small.graphml", "model.xml"]
    examples = [ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
               ,ShortFile [ShortGraph [Node [Att ("id","v0")],Node [Att ("id","v1")],Node [Att ("id","v2")]] [Edge [Att ("id","con0"),Att ("source","v1"),Att ("target","v0")],Edge [Att ("id","con1"),Att ("source","v0"),Att ("target","v2")]]]]

test::(String, ShortFile) -> IO()
test(path, example) =do
    file <- readGraph path []
    let result = parseGraph file
    if result /= example
      then
        error $ "Test failed on: " ++ show path
      else
        putStrLn $ "Test passed on: " ++ show path 
