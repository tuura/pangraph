module Tuura.Fantasi.Options (Options(..), getOptions) where

import Data.Foldable
import Control.Monad
import System.Console.GetOpt
import System.Environment
import System.Exit

data Options = Options
    { optHelp      :: Bool
    , optVersion   :: Bool
    , optGraphML   :: FilePath
    , optGraphName :: FilePath
    , optSimName   :: FilePath }

defaultOptions :: Options
defaultOptions = Options
    { optHelp      = False
    , optVersion   = False
    , optGraphML   = ""
    , optGraphName = "graph.vhdl"
    , optSimName   = "sim-environment.vhdl" }

options :: [OptDescr (Options -> IO Options)]
options =
    [ Option ['n'] ["graph-name"]
      (ReqArg (\f opts -> return opts { optGraphName = f }) "FILEPATH")
      "VHDL graph output file-path"

    , Option ['s'] ["sim-name"]
      (ReqArg (\f opts -> return opts { optSimName = f }) "FILEPATH")
      "VHDL simulation environment output file-path"

    , Option ['h'] ["help"]
      (NoArg (\opts -> return opts { optHelp = True }))
      "Show this help message"

    , Option ['v'] ["version"]
      (NoArg (\opts -> return opts { optVersion = True }))
      "Show version of Fantasi"
    ]

getOptions :: IO Options
getOptions = do
    argv   <- getArgs
    result <- case getOpt Permute options argv of
        (opts, [] , []) -> foldlM (flip id) defaultOptions opts
        (opts, [f], []) -> foldlM (flip id)
                                     defaultOptions { optGraphML   = f } opts
        (_   , _  , []) -> ioError $ userError tooManyArgsMessage
        (_   , _  , es) -> ioError . userError $ concat es
    when (optHelp result) $ do
        progName <- getProgName
        let header = "Usage: " ++ progName ++ inputArgsMessage
            helpMessage = usageInfo header options
        putStrLn helpMessage
        exitSuccess
    when (optVersion result) $ do
        progName   <- getProgName
        let versMessage = progName ++ pangraphVersion
        putStrLn versMessage
        exitSuccess
    return result

notEnoughArgsMessage :: String
notEnoughArgsMessage = "First argument must be" ++ inputArgsMessage

tooManyArgsMessage :: String
tooManyArgsMessage = "Too many arguments"

inputArgsMessage :: String
inputArgsMessage = " [graphml file]"

pangraphVersion :: String
pangraphVersion = " 0.1v"
