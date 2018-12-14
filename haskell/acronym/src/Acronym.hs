{-# LANGUAGE OverloadedStrings #-}

module Acronym
        ( abbreviate
        )
where

import qualified Data.Char                     as C
import qualified Data.List                     as L
import qualified Data.Text                     as T
import           Data.Text                      ( Text )

getWords :: Text -> [Text]
getWords s = T.words $ T.replace "-" " " s

hasSecondInitial :: Text -> Bool
hasSecondInitial t = T.any C.isUpper t && not (T.all C.isUpper t)

-- This function could probably be improved :thinking_face:
findInitial :: Text -> Text -> Text
findInitial acc t =
        let Just (first, rest) = T.uncons t
        in  if hasSecondInitial rest
                    then
                            let Just up = T.find C.isUpper rest
                            in  T.snoc (T.snoc acc first) up
                    else T.snoc acc $ C.toUpper first

reduceInitials :: [Text] -> Text
reduceInitials = L.foldl findInitial ""

abbreviate :: Text -> Text
abbreviate = T.toUpper . reduceInitials . getWords
