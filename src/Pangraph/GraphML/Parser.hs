module Pangraph.GraphML.Parser (
parse,
unsafeParse
) where

import qualified Data.ByteString            as BS
import qualified Pangraph                   as P
import qualified Pangraph.Internal.Hexml    as H
import qualified Pangraph.XMLTemplate       as PT

parse :: BS.ByteString -> Maybe P.Pangraph
parse file =
  case H.hexmlParse file of
    Nothing -> Nothing
    Just hexml -> PT.hexmlToPangraph PT.graphMLTemplate hexml

unsafeParse :: BS.ByteString -> P.Pangraph
unsafeParse file =
  case parse file of
      Just pangraph -> pangraph
      Nothing -> error $ "Parse failed"
