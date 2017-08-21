module Pangraph.GraphML.Parser (
parse,
unsafeParse
) where

import Data.Maybe
import qualified Data.ByteString            as BS
import qualified Pangraph                   as P
import qualified Text.XML.Hexml as H
import qualified Pangraph.Internal.XMLTemplate       as PT

-- * Parsing

-- | Returns 'Pangraph' if it can be parsed from a raw GraphML file.
parse :: BS.ByteString -> Maybe P.Pangraph
parse file = either (const Nothing) (PT.hexmlToPangraph PT.graphMLTemplate) (H.parse file)

-- | Like 'parse' except it throws an error on Nothing, which is when parsing fails.
unsafeParse :: BS.ByteString -> P.Pangraph
unsafeParse file = fromMaybe (error "Parse failed") (parse file)
