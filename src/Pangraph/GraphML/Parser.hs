module Pangraph.GraphML.Parser (
parse,
unsafeParse
) where

import Data.Maybe
import Data.Either
import qualified Data.ByteString            as BS
import qualified Pangraph                   as P
import qualified Text.XML.Hexml as H
import qualified Pangraph.XMLTemplate       as PT

parse :: BS.ByteString -> Maybe P.Pangraph
parse file = either (const Nothing) (PT.hexmlToPangraph PT.graphMLTemplate) (H.parse file)

unsafeParse :: BS.ByteString -> P.Pangraph
unsafeParse file = fromMaybe (error "Parse failed") (parse file)
