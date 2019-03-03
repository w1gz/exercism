module DNA
        ( nucleotideCounts
        , Nucleotide(..)
        )
where

import           Control.Monad (foldM)
import           Data.Map      (Map)
import qualified Data.Map      as M

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

incrementNucleotide :: Nucleotide -> Either String (Map Nucleotide Int)
incrementNucleotide n = Right $ M.fromList [(n, 1)]

toNucleotide :: Char -> Either String (Map Nucleotide Int)
toNucleotide char | char == 'A' = incrementNucleotide A
                  | char == 'C' = incrementNucleotide C
                  | char == 'G' = incrementNucleotide G
                  | char == 'T' = incrementNucleotide T
                  | otherwise   = Left $ show char

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts s = foldM countNucleotide startingValue nucleotidesFound
    where
        countNucleotide  = fmap . M.unionWith (+)
        startingValue    = M.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
        nucleotidesFound = fmap toNucleotide s
