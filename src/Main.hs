module Main () where

import Text.Parsec
import Text.Parsec.String (Parser)
import Data.Typeable
import Data.Either
import qualified System.Environment as Env
-- import System.Directory  
import System.IO  
import Data.List  

main :: IO ()
main = do
  [cmd,path]<- words getArgs
  
  putStrLn "hello world"

--Graphs take the form graph attributes, list of nodes, list of (tupled) arcs.
data Arc = Arc (String, String) deriving (Show)
data Node = Node String deriving (Show)
type Tag = Either Arc Node
data Graph = Graph  {   attributes::    [String]
                    ,   nodes::         [Node]
                    ,   arcs::          [Arc]
                    }   deriving (Show)

--This function should handle IO
-- readGraphML:: String -> Graph
-- readGraphML xs = findGraph xs

--This function links together finding of the graph then parsing its nodes and arcs
findGraph:: String -> Graph
findGraph=do{
            ;   graph <- try (many graphTag) <?> "no graph found"
            ;   tags <- many $ choice [nodeTag, edgeTag]
            ;   (arcs, nodes) <- partitionEithers tags
            ;   let g = Graph graph nodes arcs
            ;   return g
            }

graphTag:: Parser String
graphTag=do {
            ;   spaces
            ;   string "<graph id=\""
            ;   name <- many letter <?> "valid id"
            ;   many (oneOf "\"") <?> "attribute open"
            ;   spaces
            ;   string "edgedefault=\""
            ;   name ++ many letter
            ;   string "\">" <?> "attribute open"
            ;   return name
            }

nodeTag:: Parser Tag
nodeTag=do  {
            ;   spaces
            ;   string "<node id=\""
            ;   name <- many letter <?> "valid id"
            ;   string "\"/>" <?> "closing bracket \"/>\""
            ;   let x = Node name
            ;   return $ Right x
            }

edgeTag:: Parser Tag
edgeTag=do  {
            ;   spaces
            ;   string "<edge source=\""
            ;   srcName <- many (letter) <?> "source name"
            ;   string "\" target=\"" <?> "target name"
            ;   tarName <- many (letter) <?> "source name"
            ;   string "\"/>" <?> "closing bracket \"/>\""
            ;   let y = Arc (srcName, tarName)
            ;   return $ Left y
            }

-- endGraph:: Parser Tag
-- endGraph=do  {
            -- ;    x <- string "<\/graph>"
            -- ;    return x
            -- }

-- tagSort::[Tag]->([Arc],[Node])
-- tagSort [ts]=do{
  -- ;a <- ArcSort ts
  -- ;n <- NodeSort ts
  -- ;return (a,n)
  -- }

-- ArcSort::[Tag] -> [Arc]
-- ArcSort [] = []
-- ArcSort [a:aa]=do
  -- if(typeOf a == typeOf Arc)then xs <- a
  -- return xs ++ ArcSort aa

-- NodeSort::[Tag] -> [Node]
-- NodeSort [] = []
-- NodeSort [a:aa]=do
  -- if(typeOf a == typeOf Node)then xs <- a
  -- return xs ++ NodeSort aa