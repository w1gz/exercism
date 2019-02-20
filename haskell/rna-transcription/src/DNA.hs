module DNA ( toRNA ) where

charToRNA :: Char -> Either Char Char
charToRNA char | char == 'A' = Right 'U'
               | char == 'C' = Right 'G'
               | char == 'G' = Right 'C'
               | char == 'T' = Right 'A'
               | otherwise   = Left char

toRNA :: String -> Either Char String
toRNA = traverse charToRNA
