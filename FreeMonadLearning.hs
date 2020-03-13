{-# LANGUAGE MultiParamTypeClasses #-} --Enables multiple parameterized type classes

class MyTypeClass x where
    doThisX :: x -> x

class (MyTypeClass x) => MyTypeClass2 a x where
    doThat :: a->x
    doThat2 :: x -> a


class MyTypeClass3 x y z where
    doThisZ :: z->x ->y


data MyData1  = Data1 deriving (Show)

data MyData2 a = Data2 | Data2Extend (MyData2 a) deriving (Show)

data MyData3 a b = LeftData3 a | RightData3 b deriving (Show)

newtype MyFinalData a b c =  MyFinalData (MyData3 (MyData2 a) (MyData3 (MyData1) c)) deriving (Show)


instance MyTypeClass3 (MyFinalData a b c ) (MyData2 a) (MyData1) where
    doThisZ = undefined

instance MyTypeClass MyData1 where
    doThisX x = x

instance MyTypeClass2 (MyData2 a) MyData1 where
    doThat (Data2) = Data1
    doThat2 (Data1) = Data2

x :: MyData1
x = Data1