import System.IO 

alp :: [Char]
alp = ['a' .. 'z']

getHeight :: [Int] -> [Char] -> Char -> Int 
getHeight (x:xs) (y:ys) val 
    | val == y = x 
    | otherwise = getHeight xs ys val

ans :: [Int] -> String -> Int 
ans _ [] = 0
ans xs (y:ys) = max (getHeight xs alp y) (ans xs ys)  

main :: IO ()
main = do 
    inputLine1 <- getLine
    inputLine2 <- getLine
    let wordsHeight = map (\x -> read x :: Int) . words $ inputLine1
        input = inputLine2
    putStrLn . show $ (length input) * (ans wordsHeight input)  
