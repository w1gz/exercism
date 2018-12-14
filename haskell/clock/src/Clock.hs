module Clock
        ( addDelta
        , fromHourMin
        , toString
        )
where

import           Text.Printf

newtype Clock = Clock Integer deriving Show

instance Eq Clock where
        (==) cl1 cl2 = getTime cl1 == getTime cl2

oneHour :: Integer
oneHour = 60

oneDay :: Integer
oneDay = 24

addClocks :: Clock -> Clock -> Clock
addClocks (Clock m1) (Clock m2) = Clock $ m1 + m2

getTime :: Clock -> (Integer, Integer)
getTime (Clock cl) =
        let h = mod (div cl oneHour) oneDay
        in  let m = mod cl oneHour in (h, m)

fromHourMin :: Integer -> Integer -> Clock
fromHourMin hour minute = Clock $ hour * oneHour + minute

toString :: Clock -> String
toString clock = let (h, m) = getTime clock in printf "%02d:%02d" h m

addDelta :: Integer -> Integer -> Clock -> Clock
addDelta hour minute clock = addClocks clock $ fromHourMin hour minute

