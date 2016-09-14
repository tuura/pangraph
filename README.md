[![Build Status](https://travis-ci.org/thisiswhereitype/pangraph.svg?branch=master)](https://travis-ci.org/thisiswhereitype/pangraph)

#pangraph
This is a Haskell Library for parsing graphs formats e.g. [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](www.workcraft.org).
I aiming to produce a program which will parse any undirected graph.  
With the aim of helping people who are building programs that use mathematical graphs, multiple formats are less of an issue.

##How do I use it?
The pangraph library exports exactly one function from `Parsers.hs` and the types used from `PubTypes.hs`.  
The function is `parseFile` which takes three string arguments: `file, path, [args]`. Currently the args are no used so you can pass an empty list. This function returns a ShortFile type. Repeated below are the types:  

```
data Node = Node [Attribute] deriving (Show)
data Edge = Edge [Attribute] deriving (Show)
data ShortGraph = ShortGraph [Node] [Edge] deriving (Show)
data ShortFile = ShortFile [ShortGraph] deriving (Show)
```

##Graph support

###[GraphML](http://graphml.graphdrawing.org/)
Graphml files are currently fully implemented.

###[Workcraft](www.workcraft.org)
Workcraft files need to be unzipped manually and given a path to the model.xml file that was unzipped.
