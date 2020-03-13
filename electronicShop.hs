import System.IO 


main :: IO ()
main = do 
    firstLine <- getLine
    secondLine <- getLine
    thirdLine <- getLine
    let maxLimit = head . map (\x -> read x :: Int) . words $ secondLine  
        a =  map (\x -> read x :: Int) . words $ secondLine        
        b =  map (\x -> read x :: Int) . words $ thirdLine 
        c = maximum [x+y | x <- a , y <- b , x + y <= maxLimit ]
    putStrLn . show $ c 



