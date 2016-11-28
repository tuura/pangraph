module Main where

import Pangraph
import qualified Pangraph.GraphML.Writer as GWriter
import qualified Pangraph.GraphML.Parser as GParser
import qualified Pangraph.Workcraft.Parser as WParser

main :: IO ()
main =do
  putStrLn $ "*Parsing Test: #" ++ show (length parseTests)
  parseGraphML $ parseTests !! 0
  parseWorkcraft $ parseTests !! 1
  putStrLn "*Parse tests passed\n"
  putStrLn $ "*Writing Test: #" ++ show (length writeTests)
  writeGraphML $ writeTests !! 0
  writeGraphML $ writeTests !! 1
  writeGraphML $ writeTests !! 2
  putStrLn "*Write tests passed\n"
  putStrLn "*Big test"
  bigGraphML "examples/graphs/big.graphml"
  putStrLn "--------Tests Passed--------"
  where
    parseTests = zip parsePaths examples
    writeTests = zip writePaths examples
    parsePaths = map ("examples/graphs/"++) ["small.graphml", "model.xml"]
    writePaths =["temp1.graphml"
                , "examples/temp2.graphml"
                , "/examples/temp3.graphml"]
    examples =cycle [ShortFile [ShortGraph
                      [Node [Att ("id","n0")]
                      ,Node [Att ("id","n1")]
                      ,Node [Att ("id","n2")]]
                      [Edge [Att ("source","n0")
                      ,Att ("target","n2")]]]
                    ,ShortFile [ShortGraph
                      [Node [Att ("id","v0")]
                      ,Node [Att ("id","v1")]
                      ,Node [Att ("id","v2")]]
                      [Edge [Att ("id","con0")
                      ,Att ("source","v1")
                      ,Att ("target","v0")]
                      ,Edge [Att ("id","con1")
                      ,Att ("source","v0")
                      ,Att ("target","v2")]]]]

parseGraphML:: (FilePath, ShortFile) -> IO()
parseGraphML (path, example)=do
  putStrLn $ "  Reading from: " ++ path
  file <- readFile $ normalizePath path
  let result = GParser.parseFile path file
  if result /= example
    then
      error $ "Test failed on: " ++ show path
    else
      putStrLn $ "Test passed on: " ++ path

parseWorkcraft::(FilePath, ShortFile) -> IO()
parseWorkcraft (path, example)=do
  putStrLn $ "  Reading from: " ++ path
  file <- readFile $ normalizePath path
  let result = WParser.parseFile  path file
  if result /= example
    then
      error $ "Test failed on: " ++ show path
    else
      putStrLn $ "Test passed on: " ++ path

bigGraphML::FilePath -> IO()
bigGraphML path=do
  putStrLn $ "  Reading from: " ++ path
  file <- readFile path
  let result =seq $ GParser.parseString file
  putStrLn $ "Test passed on: " ++ path


writeGraphML::(String, ShortFile) -> IO()
writeGraphML (path, g)=do
  putStrLn $ "  Writing to: " ++ path
  GWriter.writeGraph path g
  -- putStrLn ""
  parseGraphML (path, g)

normalizePath::FilePath -> FilePath
normalizePath x= if head x `elem` "/" then tail x else x
