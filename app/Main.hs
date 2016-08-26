module Main where

--Hackage/Base
import System.IO
import Text.Parsec
import Data.Either

--My modules
import Gmlp
import Types
import Shorten

main :: IO ()
main = do
  putStrLn "File name:"
  file <- getLine
  let path = file ++ ".graphml"
  x <- readFile path
  -- let z = [] :: (Either a File)
  let z = parse parseFile path x
  putStrLn $ show z
  putStrLn $ show (shortenFile (head (rights [z])))
  putStrLn "complete"

-- printShortGraph:: File -> IO()
-- printShortGraph x= putStrLn show $ shortenFile x
--
-- printParseErr:: ParseError -> IO()
-- printParseErr _ = putStrLn "parse err"
