module Prime (nth) where

-- replace this package by my own
import qualified Data.Numbers.Primes as P

nth :: Int -> Maybe Integer
nth n
  | n < 1 = Nothing
  | otherwise = Just $ P.primes !! (n - 1)
