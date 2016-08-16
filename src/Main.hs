import Text.Parsec
import Text.Parsec ((<?>))
import Text.Parsec ((<|>))
import Data.Typeable
import Data.Either
import System.IO
import Control.Applicative

main :: IO ()
main = do
  let path = "C:\\Users\\testuserignore\\github\\has\\gmlp\\small.graphml.xml"
  x <- readFile path
  let y  = parse findGraph path x
  putStrLn $ show y

data Attribute = Attribute (String, String) deriving (Show)
data Data = Data (String, String) deriving (Show)
data Tag = Tag [Attribute] [Data] deriving (Show)
data Key = Key [Attribute] String deriving (Show)
data Edge = Edge Tag deriving (Show)
data Node = Node Tag deriving (Show)
data Graph = Graph  {   attributes::    [Attribute]
                    ,   nodes::         [Node]
                    ,   arcs::          [Edge]
                    ,   subGraph::         [Graph]
                    }   deriving (Show)

data File = File  {  xml:: [Attribute]
                  ,  meta:: [Attribute]
                  ,  keys:: [Key]
                  ,  graphs:: [Graph]
                  }  deriving (Show)

attributeParse:: Parsec String () Attribute
attributeParse=try $ do
  spaces
  x <- Main.anyTill "=\""
  y <- manyTill anyChar (char '"')
  return $ Attribute (x, y)

dataParse::Parsec String () Data
dataParse=do
  many $ oneOf " \n"
  _ <- string "<data"
  _ <- Main.anyTill "\""
  xs <- Main.anyTill "\">"
  ys <- Main.anyTill "<"
  _ <- string "/data>"
  return $ Data (xs,ys)

tagParse::String -> Parsec String () Tag
tagParse xs =do
  _ <-  Main.manyTill $ "<" ++ xs
  as <- Main.manyTill attributeParse
  _ <- try $ string "/>" <|> ds <- dataParse
  manyTill $ "</" ++ xs ++ ">"
  return $ Tag as ds

orData:: Parsec String () Maybe Data
orData=

keyParse::Parsec String () Key
keyParse=do
  _ <- Main.manyTill "<key"
  as <- attributeParse
  _ <- try $ string "/>"
  <|> ds <- (string "<default>" *> many alphaNum <* string "</default>")
  return $ Key as ds

graphParse:: Parsec String () Graph
graphParse=do
  _ <- Main.manyTill "<graph "
  as <- attributePArse

anyTill::String -> Parsec String () String
anyTill xs = manyTill anyChar (try $ string xs)
