{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import qualified Data.Char as C
import qualified Data.Text as T
import           Data.Text (Text)

isEmpty :: Text -> Bool
isEmpty = T.null

isYellingQuestion :: Text -> Bool
isYellingQuestion s = isQuestion s && isYelling s

isYelling :: Text -> Bool
isYelling s = T.any C.isUpper s && not (T.any C.isLower s)

isQuestion :: Text -> Bool
isQuestion = (Just '?' ==) . fmap snd . T.unsnoc

responseFor :: Text -> Text
responseFor = response . T.stripEnd

response :: Text -> Text
response s
  | isEmpty s = "Fine. Be that way!"
  | isYellingQuestion s = "Calm down, I know what I'm doing!"
  | isYelling s = "Whoa, chill out!"
  | isQuestion s = "Sure."
  | otherwise = "Whatever."
