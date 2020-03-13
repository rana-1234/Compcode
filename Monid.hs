import GHC.Generics
import Data.Aeson


newtype Sum = Sum Int deriving (Show)

newtype Product = Product Int deriving (Show)

instance Semigroup Sum where 
    (<>) (Sum x) (Sum y) = Sum (x + y)

instance Monoid Sum where
    mempty = (Sum 0) 
    mappend (Sum x) (Sum y ) = Sum (x + y)
    mconcat x = undefined  


instance Semigroup Product where 
    (<>) (Product x) (Product y) = Product (x*y)

instance Monoid Product where 
    mempty =  (Product 1)
    mappend = (<>)
    mconcat = undefined
    