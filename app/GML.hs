module Main where

--Hackage/Base
import System.IO
import Text.Parsec
import Data.Either

--My modules
import qualified GmlP as G
import Types
import Shorten

main :: IO ()
main = do
  putStrLn "File name:"
  path <- getLine
  x <- readFile path
  let z = parse G.parseFile path x
  -- putStrLn $ show z
  putStrLn $ show (shortenFile (head (rights [z])))
  putStrLn "complete"

-- printShortGraph:: File -> IO()
-- printShortGraph x= putStrLn show $ shortenFile x
--
-- printParseErr:: ParseError -> IO()
-- printParseErr _ = putStrLn "parse err"
