module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = [x | x <- xs, (not . p) x]
-- idiomatic filter version: `discard p xs = filter (not . p) xs`

keep :: (a -> Bool) -> [a] -> [a]
keep p xs = [x | x <- xs, p x]
-- idiomatic filter version: `filter p xs`
