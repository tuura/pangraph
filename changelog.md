# Changelog

## pangraph-0.3.0
1. Implement a parser for and serializer for the Pajek graph language. See [#39](https://github.com/tuura/pangraph/pull/39) Thanks [zouroboros](https://github.com/zouroboros)!
2. Use Stack to generate new pvp bounds.
Formerly:
```haskell
algebraic-graphs    == 0.3.*
attoparsec          == 0.13.*
bytestring          == 0.10.*
containers          == 0.5.*
fgl                 == 5.6.*
hexml               == 0.3.*
html-entities       == 1.1.*
text                == 1.2.*
```
To the following generated with stack LTS-13.8:
```haskell
base                >=4.8 && <5,
algebraic-graphs    ==0.3.*,
attoparsec          >=0.13.2.2 && <0.14,
bytestring          >=0.10.8.2 && <0.11,
containers          >=0.6.0.1 && <0.7,
fgl                 >=5.7.0.1 && <5.8,
hexml               >=0.3.4 && <0.4,
html-entities       >=1.1.4.2 && <1.2,
text                >=1.2.3.1 && <1.3
```

## pangraph-0.2.1
* Bump Algebraic Graphs from 0.1.* to 0.2.*

## pangraph-0.2.0 
* Addition of conversion and revert for FGL.
* Addition of Parser, Serializer and AST for GML.
* Change `Edge` types to now only construct with a `VertexID` type.
* Change `edgeEndpoints` to return VertexID.

## pangraph-0.1.2 141360fbc2b6ca232ce91a9b14aa9a626082ba92 08/06/2018
Note: First Hackage release which follows correct cabal versioning increments.  
* Addition of Containers (convert).
* Bump to Stack LTS.
* Update to Algebraic Graphs to build with more versions.

## pangraph-0.1.1.5 49bc8a38842256b7fb7c285725dcfb6dfb03cfcb 03/02/2018  
Note: First hackage release, prior to this on the repo there are many issues with commits.  
Note: Commit date earlier.  
Note: This list is of all features up to this point.  
* Parser and serlizer for subset of Graphml.
* Implementation of Algebraic Graphs.