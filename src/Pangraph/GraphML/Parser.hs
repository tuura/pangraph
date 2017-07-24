module Pangraph.GraphML.Parser (
parse,
unsafeParse
) where

import qualified Data.ByteString            as BS
import qualified Pangraph                   as P
import qualified Pangraph.Internal.Error    as E
import qualified Pangraph.Internal.Hexml    as H
import qualified Pangraph.XMLTemplate       as PT

parse :: BS.ByteString -> Either P.PangraphError P.Pangraph
parse file =
  case H.hexmlParse file of
    Left err -> Left err
    Right hexml -> PT.hexmlToPangraph PT.graphMLTemplate hexml

unsafeParse :: BS.ByteString -> P.Pangraph
unsafeParse file =
  case parse file of
    Left pangraphError -> error (show pangraphError)
    Right pangraph -> pangraph
