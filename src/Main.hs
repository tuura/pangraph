import qualified Text.Parsec as Parsec
import Text.Parsec ((<?>))
import Text.Parsec ((<|>))
import Data.Typeable
import Data.Either
-- import qualified System.Environment as Env
-- -- import System.Directory
-- import System.IO
-- import Data.List

main :: IO ()
main = do
  putStrLn "hello world"

--Graphs take the form graph attributes, list of nodes, list of (tupled) arcs.
data Arc = Arc [(String, String)] deriving (Show)
data Node = Node [(String, String)] deriving (Show)
type Tag = Either Arc Node
data Graph = Graph  {   attributes::    [String]
                    ,   nodes::         [Node]
                    ,   arcs::          [Arc]
                    }   deriving (Show)

-- This function links together finding of the graph then parsing its nodes and arcs
findGraph:: Parsec.Parsec String () Graph
findGraph=do
  graph <- Parsec.try (Parsec.many graphTag) <?> "no graph found"
  tags <- Parsec.many $ Parsec.choice [edgeTag, nodeTag]
  endTag <?> "closing graph tag: \"</graph>\""
  (arcs, nodes) <- partitionEithers tags
  let g = Graph graph nodes arcs
  return g

endTag:: Parsec.Parsec String () ()
endTag = Parsec.spaces >> Parsec.string "</graph>"

graphTag:: Parsec.Parsec String () Tag
graphTag=do
  Parsec.spaces
  Parsec.string "<graph id=\""
  xs <- multiAttribute
  Parsec.string "/>"
  return xs

--returns a tupled list of a tags attirubtes.
multiAttribute:: Parsec.Parsec String () [(String, String)]
multiAttribute=Parsec.sepBy attribute Parsec.spaces

--parses an attribute from a tag
attribute::Parsec.Parsec String () (String, String)
attribute=do
  x <- alphaNum
  Parsec.string "=\""
  y <- alphaNum
  Parsec.char '\"'
  return (x, y)

alphaNum::Parsec.Parsec String () String
alphaNum=Parsec.many $ do
  xs <- (Parsec.letter <|> Parsec.digit)
  return xs

nodeTag:: Parsec.Parsec String () Tag --[(String, String)]
nodeTag=do
  Parsec.spaces >> Parsec.string "<node"
  xs <- multiAttribute
  Parsec.string "\">"
  return $ Right xs

edgeTag:: Parsec.Parsec String () Tag --[(String, String)]
edgeTag=do
  Parsec.spaces >> Parsec.string "<edge"
  xs <- multiAttribute
  Parsec.string "\">"
  return $ Left xs
