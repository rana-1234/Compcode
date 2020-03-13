import System.IO 
import Control.Monad
import System.Environment
import System.IO.Unsafe

growth :: Int -> [Int] -> [Int]
growth up (x:xs) 
    | up >= 0 =  growth (up-2) ((2*x+1) : (2*x) : x : xs)
    | otherwise = (x:xs)   

getAns :: [Int] -> Int -> Int 
getAns (q:qs) counter 
    | counter == 0 = q 
    | otherwise = getAns qs (counter-1)

main :: IO ()
main = do 
    t <- readLn :: IO Int 
    let q =  reverse ( growth 60 [1])
    forM_ [1 .. t] $ \t_itr -> do
        n <- getLine
        let val = read n :: Int 
            ans = getAns q val   
        putStrLn $ show ans
    