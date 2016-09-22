#pangraph

[![Build Status](https://travis-ci.org/thisiswhereitype/pangraph.svg?branch=master)](https://travis-ci.org/thisiswhereitype/pangraph)  

This is a Haskell Library for parsing graphs formats such as [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](www.workcraft.org).
The library currently implements parsing only the nodes and edges of undirected graphs.  
See the User Guide for how to use this, with examples below.
Also information on current graph support below that.

##User Guide  
The library `Pangraph` exports the following types:

```
data Att = Att (String, String) deriving (Show, Eq)
data Node = Node [Att] deriving (Show, Eq)
data Edge = Edge [Att] deriving (Show, Eq)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show, Eq)
data ShortFile = ShortFile [ShortGraph] deriving (Show, Eq)

type File = String
type Args = [String]
data ParseInstance = ParseInstance FilePath File (String -> String -> ShortFile) Args
```
And the following functions:

```
readGraph::FilePath -> Args -> IO (ParseInstance)
parseGraph::ParseInstance-> ShortFile
writeGraph::FilePath -> ShortFile -> IO ()
```

The first five types above define a graph. When parsed one ShortFile will be produced containing one ShortGraph containing zero or more edges and arcs. The library does not check the graphs for correctness however.

Some graphs are not in plaintext so a `readGraph` function is provided which will return a `ParseInstance` type. Passing the returned instance into `parseGraph` will return the `ShortFile`. **You must include a file type!**
Currently no arguments are implemented and they completely ignored.

##Examples  

###Parsing a Graph file  
Using the following `Main.hs`  
```
module Main where

import System.IO
import Pangraph as P

main::IO()
main=do
  -- Reading input
  putStrLn "File name:"
  path <- getLine

  -- Reading the graph in.
  w <- P.readGraph path []

  -- Parsing the graph and printing
  let z = P.parseGraph w
  putStrLn $ show z
  putStrLn "complete"
```
Passing the following input `examples/small.graphml`, provided with the library will cause the ShortFile to be printed.
```
File name:
examples/small.graphml
ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
complete
```

###Parsing a graph and then writing to a file
```
module Main where

import System.IO
import Pangraph as P

main::IO()
main=do
  -- Getting source graph file
  putStrLn "Source file:"
  source <- getLine
  -- Reading and parsing.
  w <- P.readGraph source []
  let z = P.parseGraph w
  -- Getting destination
  putStrLn "Destination:"
  dest <- getLine
  -- Write the graph to file.
  P.writeGraph dest z
  putStrLn "complete"
```
Running the program as follows results in the entered file being written to the current directory "/example1.graphml".
```
Source file:
examples/small.graphml
Destination:
/example1.graphml
complete
```

##Graph support  

###[GraphML](http://graphml.graphdrawing.org/)
Graphml files are currently:  
- Parsing: Ok  
- Writing: Ok

###[Workcraft](www.workcraft.org)
Workcraft files are currently:  
- Parsing: need to be unzipped manually and given a path to the `model.xml` file that was unzipped.  
- Writing: **Unimplemented**
