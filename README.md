#pangraph

[![Build Status](https://travis-ci.org/thisiswhereitype/pangraph.svg?branch=master)](https://travis-ci.org/thisiswhereitype/pangraph)  

This is a Haskell Library for parsing graphs formats e.g. [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](www.workcraft.org).
With the aim of helping people who are building programs that use mathematical graphs, multiple formats are less of an issue.

##Guide  
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
readGraph::FilePath -> Args ->IO (ParseInstance)
parseGraph::ParseInstance-> ShortFile
```

The first five types above are define a graph. A file will parse one graph, which contains and list of edges and nodes.
A node and edge will contain tuple pairs of fields and names.
The fields and names will be and identifer, source and target in the case of a edges, or only an identifer for nodes.  

Some graphs are not in plaintext so a `readGraph` function is provided which will return a `ParseInstance` type. Passing the returned instance into `parseGraph` will return the `ShortFile`.
Currently no args are implemented so are ignored; an empty list will suffice.

##Examples  

###Parsing a Graph file  
Using the following `Main.hs`  
```
module Main where

import System.IO
import Pangraph as P

main::IO()
main=do
  putStrLn "File name:"
  path <- getLine
  w <- P.readGraph path []
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

##Graph support  

###[GraphML](http://graphml.graphdrawing.org/)
Graphml files are currently fully implemented.

###[Workcraft](www.workcraft.org)
Workcraft files need to be unzipped manually and given a path to the `model.xml` file that was unzipped.
