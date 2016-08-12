import qualified Text.Parsec as Parsec
import Text.Parsec ((<?>))
import Text.Parsec ((<|>))
import Data.Typeable
import Data.Either

main :: IO ()
main = do
  putStrLn "hello world"

--Graphs take the form graph attributes, list of nodes, list of (tupled) arcs.
data Arc = Arc [(String, String)] deriving (Show)
data Node = Node [(String, String)] deriving (Show)
type Tag = Either Arc Node
data Graph = Graph  {   attributes::    [(String,String)]
                    ,   nodes::         [Node]
                    ,   arcs::          [Arc]
                    }   deriving (Show)


-- This function links together finding of the graph then parsing its nodes and arcs
findGraph:: Parsec.Parsec String () Graph
findGraph=do
  graph <- Parsec.many graphTag <?> "no graph found"
  tags <- Parsec.many $ Parsec.choice [edgeTag, nodeTag]
  endTag <?> "closing graph tag: \"</graph>\""
  let (arcs, nodes) = partitionEithers tags
  return $ Graph graph nodes arcs


--------Tag Parsers---------

graphTag:: Parsec.Parsec String () [(String,String)]
graphTag=do
  Parsec.spaces
  _ <- Parsec.string "<graph"
  xs <- multiAttribute
  _ <- Parsec.string "/>"
  return xs

nodeTag:: Parsec.Parsec String () Tag --[(String, String)]
nodeTag=do
  Parsec.spaces
  _ <- Parsec.string "<node"
  xs <- multiAttribute
  _ <- Parsec.string "\">"
  return $ Right $ Node xs

edgeTag:: Parsec.Parsec String () Tag --[(String, String)]
edgeTag=do
  Parsec.spaces
  _ <- Parsec.string "<edge"
  xs <- multiAttribute
  _ <- Parsec.string "\">"
  return $ Left $ Arc xs

endTag :: Parsec.Parsec String () ()
endTag = do
  Parsec.spaces
  _ <- Parsec.string "</graph>"
  return ()

----------Auxillary functions----------

--returns a tupled list of a tags attirubtes.
multiAttribute:: Parsec.Parsec String () [(String, String)]
multiAttribute=Parsec.sepBy attribute Parsec.spaces

--parses an attribute from a tag
attribute::Parsec.Parsec String () (String, String)
attribute=do
  x <- alphaNum
  _ <- Parsec.string "=\""
  y <- alphaNum
  Parsec.char '\"'
  return (x, y)

alphaNum::Parsec.Parsec String () String
alphaNum=Parsec.many $ do
  xs <- (Parsec.letter <|> Parsec.digit)
  return xs
