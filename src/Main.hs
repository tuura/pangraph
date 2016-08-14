import qualified Text.Parsec as P
import Text.Parsec ((<?>))
import Text.Parsec ((<|>))
import Data.Typeable
import Data.Either
import System.IO

main :: IO ()
main = do
  let path = "C:\\Users\\testuserignore\\github\\has\\gmlp\\small.graphml.xml"

  x <- readFile path
  -- x <- getLine
  let y  = P.parse findGraph path x
  putStrLn $ show y
  -- putStrLn $ show attributes y
  -- putStrLn $ show nodes y
  -- putStrLn $ show arcs y

-- tellGraph :: (Show a) => Graph [(String, String)] [Node] [Arc] a -> IO()
-- tellGraph (Graph {attributes = a, nodes = n arcs = v}) =do
--   putStrLn a
--   putStrLn n
--   putStrLn v

--Graphs take the form graph attributes, list of nodes, list of (tupled) arcs.
data Arc = Arc [(String, String)] deriving (Show)
data Node = Node [(String, String)] deriving (Show)
type Tag = Either Arc Node
data Graph = Graph  {   attributes::    [(String,String)]
                    ,   nodes::         [Node]
                    ,   arcs::          [Arc]
                    }   deriving (Show)


-- This function links together finding of the graph then parsing its nodes and arcs
findGraph:: P.Parsec String () Graph
findGraph=do
  _ <-P.string "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
  _ <- (P.string "<graphml")
  -- fileAtt <- P.manyTill attribute (P.char '>')
  _ <- P.manyTill P.anyChar (P.try (P.string "<graph"))
  graph <- graphTag <?> "graph tag"
  tags <- P.manyTill (((P.try nodeTag) <|> (P.try edgeTag)) <?> "edge or arc tag") (P.try endTag)
  let (arcs, nodes) = partitionEithers tags
  return $ Graph graph nodes arcs
  -- <?> "closing graph tag: \"</graph>\""

--------Tag Parsers---------

graphTag:: P.Parsec String () [(String,String)]
graphTag=do
  -- P.spaces
  -- _ <- P.string "<graph"
  xs <-P.manyTill attribute (P.string ">\n")
  return xs

nodeTag :: P.Parsec String () Tag --[(String, String)]
nodeTag=do
  P.spaces
  _ <- P.string "<node"
  xs <- tagParse
  return $ Right $ Node xs

edgeTag:: P.Parsec String () Tag --[(String, String)]
edgeTag=do
  P.spaces
  _ <- P.string "<edge"
  xs <- tagParse
  return $ Left $ Arc xs

endTag :: P.Parsec String () ()
endTag = do
  P.spaces
  _ <- P.string "</graph>\n" <?> "graph closing tag"
  return ()

----------Auxillary functions----------

-- --returns a tupled list of a tags attirubtes.
-- multiAttribute::P.Parsec String () [(String, String)]
-- multiAttribute=P.sepBy attribute P.spaces

tagParse::P.Parsec String () [(String, String)]
tagParse = P.manyTill attribute (P.string "/>\n")

--parses an attribute from a tag
attribute::P.Parsec String () (String, String)
attribute=P.try $ do
  P.spaces
  x <- P.many1 P.alphaNum
  _ <- P.string "=\""
  y <- P.many1 P.alphaNum
  _ <- P.char '"'
  return (x, y)

-- alphaNum::P.Parsec String () String
-- alphaNum=P.many $ do
--   xs <- (P.letter <|> P.digit)
--   return xs
