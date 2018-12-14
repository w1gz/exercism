module Anagram (anagramsFor) where

import qualified Data.List as L
import qualified Data.Char as C

toCanonical :: String -> String
toCanonical w = fmap C.toLower w

isAnagram :: String -> String -> Bool
isAnagram a b = (L.sort $ toCanonical a) == (L.sort $ toCanonical b)

isNotItself :: String -> String -> Bool
isNotItself a b = toCanonical a /= toCanonical b

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\w -> isAnagram xs w && isNotItself xs w) xss
