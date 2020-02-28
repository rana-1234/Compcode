import System.IO 

convertIntToRoman :: Int -> String
-- Base cases 
convertIntToRoman 1 = "I"
convertIntToRoman 4 = "IV"
convertIntToRoman 5 = "V"
convertIntToRoman 9 = "IX"
convertIntToRoman 10 = "X"
convertIntToRoman 40 = "XL"
convertIntToRoman 50 = "L"
convertIntToRoman 90 = "XC"
convertIntToRoman 100 = "C"
convertIntToRoman 400 = "CD"
convertIntToRoman 500 = "D"
convertIntToRoman 900 = "CM"
convertIntToRoman 1000 = "M"

-- for general Int 
convertIntToRoman x 
    | x > 1000 = convertIntToRoman 1000 ++ convertIntToRoman (x - 1000)
    | x > 900  = convertIntToRoman 900  ++ convertIntToRoman (x - 900)
    | x > 500  = convertIntToRoman 500  ++ convertIntToRoman (x - 500)
    | x > 400  = convertIntToRoman 400  ++ convertIntToRoman (x - 400) 
    | x > 100  = convertIntToRoman 100  ++ convertIntToRoman (x - 100)
    | x > 90   = convertIntToRoman 90   ++ convertIntToRoman (x - 90)
    | x > 50   = convertIntToRoman 50   ++ convertIntToRoman (x - 50)
    | x > 40   = convertIntToRoman 40   ++ convertIntToRoman (x - 40)
    | x > 10   = convertIntToRoman 10   ++ convertIntToRoman (x - 10)
    | x > 9    = convertIntToRoman 9    ++ convertIntToRoman ( x- 9)
    | x > 5    = convertIntToRoman 5    ++ convertIntToRoman (x - 5)
    | x > 4    = convertIntToRoman 4    ++ convertIntToRoman (x - 4)
    | x > 1    = convertIntToRoman 1    ++ convertIntToRoman (x-1)
    | otherwise = ""     


main :: IO ()
main = do 
    putStrLn "Enter a number " --  interact $ putStrLn . convertIntToRoman . read 
    inp <- getLine
    if read inp < 0 
        then return ()
    else 
        do 
            putStrLn $ convertIntToRoman $ read inp
            main 