import System.IO 
import Control.Monad 
import System.Environment
import System.IO.Unsafe


main :: IO  ()
main = do 
    test_case <- readLn :: IO Int 
    forM_ [1 .. test_case] $ \test_case_itr -> do 
        line1 <- getLine -- threshold for class cancellation 
        line2 <- getLine -- arrival times  
        let threshold = last . map (\x -> read x :: Int ) .  words $ line1
            arrivalTiming =  map (\x -> read x :: Int ) . words $ line2 
            onTime = length [x | x <- arrivalTiming , x <= 0 ]
        if onTime >= threshold then putStrLn "NO"
        else putStrLn "YES"