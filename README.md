# pangraph

[![Build Status](https://travis-ci.org/tuura/pangraph.svg?branch=master)](https://travis-ci.org/tuura/pangraph)  

This is a Haskell Library for parsing graph formats such as [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](https://www.workcraft.org/).
The library currently implements parsing only the nodes and edges of undirected graphs.  
See the User Guide for how to use this, with examples below.
Also information on current graph support below that.

## Getting Started  
The library `Pangraph` exports the following types:

```
data Att = Att (String, String) deriving (Show, Eq)
data Node = Node [Att] deriving (Show, Eq)
data Edge = Edge [Att] deriving (Show, Eq)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show, Eq)
data ShortFile = ShortFile [ShortGraph] deriving (Show, Eq)
```

The first five types above define a graph. When parsed one ShortFile will be produced containing one ShortGraph containing zero or more edges and arcs. The library does not check the graphs for correctness however.

To parse graphs you must import them directly.
```
import Pangraph.GraphML.Writer
import Pangraph.Workcraft.Parser
```

All parsers export the following:
```
module Pangraph.Example.Parser
( parseFile
, parseString
)where
```
To use these functions,
And writers export:
```
module Pangraph.GraphML.Writer
( writeGraph
) where
...
```

## Binary generation

One of the two commands below should be used for the compilation and the generation of a binary file:

```
ghc -isrc -ifantasi fantasi/Main.hs -o Fantasi
```

```
cabal install
```

## Examples  

### Parsing a Graph file  
```
module Reading where

import System.IO
import Pangraph
import qualified Pangraph.GraphML.Parser as G

main::IO()
main=do
  fileName <- getLine
  file <- readFile fileName
  let graph = G.parseAsString file
  putStr $ show graph
```

### Parsing a graph and then writing to a file
```
module Writing where

import System.IO
import Pangraph
import qualified Pangraph.GraphML.Writer as G

main::IO()
main=do
  filePath <- getLine
  G.writeGraph filePath graph
  where
    graph = ShortFile [ShortGraph [Node [Att ("id","n0")],Node [Att ("id","n1")],Node [Att ("id","n2")]] [Edge [Att ("source","n0"),Att ("target","n2")]]]
```
## Graph support  
### [GraphML](http://graphml.graphdrawing.org/)
GraphML files are currently:  
- Parsing: Ok  
- Writing: Ok

### [Workcraft](https://www.workcraft.org/)
Workcraft files are currently:  
- Parsing: need to be unzipped manually and given a path to the `model.xml` file that was unzipped.  
- Writing: **Unimplemented**
