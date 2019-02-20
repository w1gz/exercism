module SumOfMultiples
        ( sumOfMultiples
        )
where

naturalNumbersUnder :: Integer -> [Integer]
naturalNumbersUnder n = [1 .. n - 1]

isMultipleOf :: Integer -> [Integer] -> Bool
isMultipleOf n = or . fmap (\m -> m /= 0 && (n `mod` m == 0))

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples multiples =
        sum . filter (`isMultipleOf` multiples) . naturalNumbersUnder
