import System.IO 
import Data.List


validate :: [Int] -> Bool
validate x 
    | length x >= 2 = True 
    | otherwise     = False 

prodMin :: Int -> Int -> Int-> Int 
prodMin x y z = z *  min x y 

getWidth :: [Int] -> Int -> Int -> (Int -> Int -> Int -> Int) -> Int 
getWidth [] _ _ _ = -1   -- return some negative value 
getWidth (x : xs) counter value f = max (f x value counter) (getWidth xs (counter + 1) value f)  

solve :: [Int] -> Int 
solve (x:[]) = -1 
solve (x:xs) = max (getWidth xs 1 x prodMin) (solve xs) 

main :: IO ()
main = do 
    input <- getLine 
    putStrLn $ show . solve . map (\x -> read x :: Int ) . words $ input  