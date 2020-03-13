import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.List as List
import Data.Monoid
import Text.Printf

-- | Social Security Number. Commonly used as a unique identification number of a
-- person.
data SSN = SSN
  { ssnPrefix :: Int
  , ssnInfix :: Int
  , ssnSuffix :: Int
  } deriving (Eq, Ord)

instance Show SSN where
  show (SSN p i s) = printf "%03d-%02d-%04d" p i s

data Gender = Male | Female deriving (Eq, Show)

data Person = Person
  { firstName :: String
  , lastName :: String
  , gender :: Gender
  } deriving (Eq)

instance Show Person where
  show (Person fName lName g) = fName ++ ' ':lName ++ " (" ++ show g ++ ")"

type Employees = Map.Map SSN Person

mkSSN :: Int -> Int -> Int -> SSN
mkSSN p i s
  | p <= 0 || p == 666 || p >= 900 = error $ "Invalid SSN prefix: " ++ show p
  | i <= 0 || i > 99 = error $ "Invalid SSN infix: " ++ show i
  | s <= 0 || s > 9999 = error $ "Invalid SSN suffix: " ++ show s
  | otherwise = SSN p i s


employees :: Employees
employees =
  Map.fromList
    [ (mkSSN 525 21 5423, Person "John" "Doe" Male)
    , (mkSSN 521 01 8756, Person "Mary" "Jones" Female)
    , (mkSSN 585 11 1234, Person "William" "Smith" Male)
    , (mkSSN 525 15 5673, Person "Maria" "Gonzalez" Female)
    , (mkSSN 524 34 1234, Person "Bob" "Jones" Male)
    , (mkSSN 522 43 9862, Person "John" "Doe" Male)
    , (mkSSN 527 75 1035, Person "Julia" "Bloom" Female)
    ]


main :: IO ()
main = putStrLn "This is Map example"