import Prelude

data Optional m = None | Has m deriving (Show)

data Fruit = Mango deriving(Show)

type MyAnotherType = Optional [Int]

x :: Optional String
x = Has "Shashi"

class MyTypeClass thetype where
    (>>=>>) :: thetype a -> (a -> thetype b) -> thetype b
    ret     ::  a -> thetype a


instance MyTypeClass Optional where
    -- Give the implementation of the two interfaces
    None >>=>> _ = None  -- (>>==>>) None _ = None
    (Has value) >>=>> f = f value
    ret value = Has value

f :: [a] -> Optional [Fruit]
f x = Has $ repeat x
    where
        repeat [] = []
        repeat (x:xs) = Mango : (repeat xs)

g :: a -> Int
g x = 0

main :: IO ()
main = undefined