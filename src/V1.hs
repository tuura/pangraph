import qualified Text.Parsec as P
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
  let y  = P.parse findGraph path x
  putStrLn $ show y


--Graphs take the form graph attributes, list of nodes, list of (tupled) arcs.
data Attribute = Attribute (String, String) deriving (Show)
data Key = Key [Attribute] String deriving (Show)
data Data = Data Attribute deriving (Show)
data Arc = Arc [Attribute] [Data] deriving (Show)
data Node = Node [Attribute] [Data] deriving (Show)
type Tag = Either Arc Node
data Graph = Graph  {   attributes::    [Attribute]
                    ,   nodes::         [Node]
                    ,   arcs::          [Arc]
                    }   deriving (Show)

data File = File  {  xml:: [Attribute]
                  ,  meta:: [Attribute]
                  ,  keys:: [Key]
                  ,  graphs:: [Graph]
                  }  deriving (Show)

parseFile:: P.Parsec String () File
parseFile=do
  _ <- P.string "<?xml"
  xml <- P.manyTill attribute (P.char '>')
  _ <- Main.anyTill"<graphml"
  meta <- P.manyTill attribute (P.char '>')
  keys <- P.manyTill keyTag (P.try (P.string "<graph"))
  graph <-findGraph
  return $ File xml meta keys graph

-- This function links together finding of the graph then parsing its nodes and arcs
findGraph:: P.Parsec String () Graph
findGraph=do
  graph <- graphTag <?> "graph tag"
  tags <- P.manyTill (((P.try nodeTag) <|> (P.try edgeTag)) <?> "edge or arc tag") (P.try endTag)
  let (arcs, nodes) = partitionEithers tags
  return $ Graph graph nodes arcs
  -- <?> "closing graph tag: \"</graph>\""

--------Tag Parsers---------

graphTag:: P.Parsec String () [Attribute]
graphTag=do
  _ <- (Main.anyTill "<graph")
  xs <-P.manyTill attribute (P.string ">")
  return xs

nodeTag :: P.Parsec String () Tag
nodeTag=do
  P.spaces
  _ <- P.string "<node"
  xs <- closeTagParse
  return $ Right $ Node xs

edgeTag:: P.Parsec String () Tag
edgeTag=do
  P.spaces
  _ <- P.string "<edge"
  xs <- (P.try closeTagParse)
  <|> (P.try openTagParse)
  return $ Left $ Arc xs

endTag :: P.Parsec String () ()
endTag = (Main.anyTill "</graph>")

keyTag:: P.Parsec String () Key
keyTag=do
  _ <- P.string "<key"
  xs <- P.manyTill (attribute) (P.try (P.string "/>") <|> P.try(P.char '>'))
  P.spaces
  ys <- P.try enclosed
  return $ Key xs ys

----------Auxillary functions----------
closeTagParse::P.Parsec String () [Attribute]
closeTagParse = P.manyTill attribute (P.string "/>")

openTagParse::P.Parsec String () [Attribute]
openTagParse = P.manyTill attribute (P.string ">")

dataParse::P.Parsec String () Attribute
dataParse  =P.try $ do
  _ <- (Main.anyTill "<data")
  _ <- Main.anyTill "\""
  a1 <- P.manyTill P.alphaNum (P.char '\"')
  P.char '>'
  b <- (Main.anyTill "</data>")
  return $ Attribute (a1, b)

enclosed:: P.Parsec String () String
enclosed=do
 _ <- Main.anyTill ">"
 xs <- P.manyTill P.alphaNum (P.string "</")
 _ <- Main.anyTill ">"
 return xs

--parses an attribute from a tag
attribute::P.Parsec String () Attribute
attribute=P.try $ do
  P.spaces
  x <- Main.anyTill "=\""
  y <- P.manyTill P.anyChar (P.char '"')
  return $ Attribute (x, y)

anyTill::String -> P.Parsec String () String
anyTill xs = P.manyTill P.anyChar (P.string xs)

nextTag:: P.Parsec String () ()
nextTag xs= P.spaces >> P.try (P.char "\n") >> P.spaces >> _<- P.string xs

-- putStrLn $ show attributes y
-- putStrLn $ show nodes y
-- putStrLn $ show arcs y

-- tellGraph :: (Show a) => Graph [(String, String)] [Node] [Arc] a -> IO()
-- tellGraph (Graph {attributes = a, nodes = n arcs = v}) =do
--   putStrLn a
--   putStrLn n
--   putStrLn v


parseTag::P.Parsec String () Tag
