module Pangram
        ( isPangram
        )
where

import qualified Data.Char                     as C
import qualified Data.List                     as L
import qualified Data.Set                      as S
import           Data.Set                       ( Set )

removeElement :: Set Char -> Char -> Set Char
removeElement = flip $ S.delete . C.toLower

isPangram :: String -> Bool
isPangram = any S.null . L.scanl removeElement (S.fromDistinctAscList ['a' .. 'z'])
