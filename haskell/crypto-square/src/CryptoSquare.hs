{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module CryptoSquare
        ( encode
        , normalize
        , getDimension
        , formatToRectangle
        , readVertical
        )
where

import qualified Data.Char                     as C
import qualified Data.Text                     as T
import           Data.Text                      ( Text )
import           Control.Monad

isCorrect :: Char -> Bool
isCorrect = not . liftM2 (||) C.isPunctuation C.isSeparator

normalize :: Text -> Text
normalize = T.toLower . T.filter isCorrect

getDimension :: Text -> Int
getDimension = ceiling . sqrt . fromIntegral . T.length

formatToRectangle :: Text -> [Text]
formatToRectangle s = T.chunksOf (getDimension s) s

readVertical :: [Text] -> Text
readVertical = T.unwords . T.transpose

encode :: Text -> String
encode = T.unpack . readVertical . formatToRectangle . normalize
