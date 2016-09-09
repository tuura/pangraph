#pangraph
This is a Haskell Library for parsing graphs formats e.g. [GraphML](http://graphml.graphdrawing.org/) and the XML files produced by [Workcraft](www.workcraft.org).

*Todo: get a travis build thing*

#Ye be warned, here be bugs and undocumented features/changes.

##Mission

The currently I aiming to produce a program which will parse many graph types in a set of exported types.  
The aim of helping people who are building programs that use graphs, multiple formats are less of an issue. There is a commit somewhere which supports [GraphML](http://graphml.graphdrawing.org/) but I have never looked for it. Current work is laying the foundation to parse XML-like graph languages generally. The next format to be implemented will be [workcraft's](www.workcraft.org) graphs. The 'g' format will follow as it is mentioned to me most frequently.  

Drawing graphs is on the table and language to language support has crossed my mind.

<!-- ##Current State -->
##How do I use it?
If for some reason you want to use this in its current state be warned I will be changing files and libraries everywhere as I include new features and fix bugs. But I will try to keep this file uptodate.  

Anyway a description follows:  
Add `pangraph` to your cabal.  
The parsers return recursive types defined in `src\Types.hs`  
The graphml parser is in `src\GmlP.hs` it exports functions like `parseFile`  
To shorten your file type into a list of nodes & edges you should use `src/Shorten.hs` and pass your Graph structure into `shortenFile`  

Here is an example:
```
module Main where

--Hackage/Base
import System.IO
import Text.Parsec
import Data.Either

--My modules
import qualified GmlP
import Types
import Shorten

main :: IO ()
main = do
  putStrLn "File name:"
  path <- getLine
  x <- readFile path
  let z = parse G.parseFile path x
  putStrLn $ show (shortenFile (head (rights [z])))
  putStrLn "complete"
```
