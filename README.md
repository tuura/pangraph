# pangraph

[![Build Status](https://travis-ci.org/tuura/pangraph.svg?branch=master)](https://travis-ci.org/tuura/pangraph)  

This is a Haskell Library for parsing graph formats such as [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](https://www.workcraft.org/).
The library currently implements parsing only the nodes and edges of undirected graphs.  
See the User Guide for how to use this, with examples below.
Information on current graph support can be found below that.

## How to use Pangraph

Pangraph offers an api in the module `Pangraph` for accessing of graphs including constructors and getters.  
You can construct entire graph or edit the results of parser.
These are imported independently form their own modules:  
```
import Pangraph.GraphML.Parser
```

All parsers currently export the following:
```
formatToPangraph :: format -> Pangraph
```

An example of reading this code can be found in `Examples` below

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
```haskell
module Reading where

import Prelude hiding (readFile)
import Data.ByteString (readFile)
import qualified Pangraph.GraphML.Parser as GraphML_P

main:: IO ()
main = do
  fileName <- getLine
  file <- readFile fileName

  case GraphML_P.graphmlToPangraph file of
    Left hexmlErr-> putStrLn $ show hexmlErr
    Right makePangraph ->
      case makePangraph of
        Left malformedEdges -> putStrLn $ show malformedEdges
        Right pangraph -> putStrLn $ show pangraph
```

## Graph support  
### [GraphML](http://graphml.graphdrawing.org/)
GraphML files are currently:  
- Parsing: Ok  
- Writing: **Unimplemented**

### [Workcraft](https://www.workcraft.org/)
Workcraft files are currently:  
- Parsing: **Unimplemented**  
- Writing: **Unimplemented**
