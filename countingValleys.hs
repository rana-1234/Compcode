import System.IO

func :: String->[Int]
func [] = []
func (x:xs) 
    | x == 'U' = 1 : func xs 
    | otherwise = -1 : func xs 

func2 :: [Int] -> [Int]
func2 = tail . scanl (\acc x -> acc + x ) 0

ans :: [Int] -> Bool ->  Int 
ans [] _ = 0 
ans (x:xs) ground  
    | ground == True && x < 0 = 1 + ans xs False 
    | ground == False && x >= 0 = ans xs True
    | otherwise = ans xs ground   

main :: IO ()
main = do 
    n <- getLine 
    input <- getLine 
    putStrLn input
    putStrLn . show . (flip ans True) . func2 . func $ input
    main 