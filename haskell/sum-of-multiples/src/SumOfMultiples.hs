module SumOfMultiples
        ( sumOfMultiples
        )
where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples multiples n =
        let isMultiple x = any (\m -> m /= 0 && (x `rem` m == 0)) multiples
        in  sum $ filter isMultiple [1 .. n - 1]
