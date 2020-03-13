import System.IO 
import System.IO.Unsafe
import System.Environment
import Control.Monad

readStringFromInt :: Int -> String 
readStringFromInt x = show x 

reverseString :: String -> String 
reverseString = reverse 

readIntFromString :: String -> Int 
readIntFromString x = read x :: Int 

reverseNum :: Int -> Int 
reverseNum =   readIntFromString . reverseString . readStringFromInt 


main :: IO ()
main = do 
    line1 <- getLine
    let input = map (\x-> read x :: Int) . words $ line1 
        start = input !! 0 
        end   = input !! 1
        k     = input !! 2
        count = length [0 | x <- [start .. end] , abs (x - (reverseNum x)) `mod` k == 0 ]
    putStrLn (show count)