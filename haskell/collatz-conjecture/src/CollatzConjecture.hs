module CollatzConjecture
        ( collatz
        , divideOrMultiply
        )
where

divideOrMultiply :: Integer -> Integer
divideOrMultiply n | even n    = div n 2
                   | otherwise = (n * 3) + 1

collatz :: Integer -> Maybe Integer
collatz n
  | n > 0 = Just $ computeLength $ findChain n
  | otherwise = Nothing

findChain :: Integer -> [Integer]
findChain = takeWhile (/=1) . iterate divideOrMultiply

computeLength :: [Integer] -> Integer
computeLength = fromIntegral . length
