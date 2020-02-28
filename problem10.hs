import Data.List
import System.IO 

type Expression = String  
type Pattern = String 

validateExpression :: Expression -> Bool
validateExpression [] = True  
validateExpression (x:xs) 
    | x `elem` ['a' .. 'z'] = True && validateExpression xs  
    | otherwise = False

validatePattern :: Pattern -> Bool 
validatePattern [] = True 
validatePattern (x:xs) 
    | isValid x = True && validatePattern xs 
    | otherwise = False 
    where 
        isValid :: Char -> Bool 
        isValid x 
            | x == '*' = True 
            | x == '.' = True 
            | x `elem` ['a' .. 'z'] = True 
            | otherwise = False  


isPatternMatched :: Expression -> Pattern -> Bool 
isPatternMatched [] [] = True -- case when we have both empty pattern and expression
isPatternMatched  _ [] = False -- case when we have empty pattern but non-empty expression
isPatternMatched [] (x:xs)  -- case when we have empty expression and non-empty pattern
    | x == '*' = True && isPatternMatched [] xs 
    |otherwise = False

isPatternMatched (e:exp) (p:pat) 
    | (p == '.') || (e == p) = True && isPatternMatched exp pat -- if both the character matches 
    | (p == '*')             = True && (isPatternMatched (e:exp) pat || isPatternMatched exp pat)    
    | otherwise              = False 


main :: IO()
main = do
    putStrLn "Enter the expression"
    expression <- getLine
    putStrLn "Enter the pattern"
    pattern <- getLine 
    putStrLn "Working in the pattern matching..."
    case validateExpression expression of 
        True -> case validatePattern pattern of 
                    True -> case isPatternMatched expression pattern of 
                                True -> putStrLn "Pattern matched"
                                False -> putStrLn "Pattern unmatched" 
                    False -> putStrLn "Valid expression but wrong pattern"

        False ->  putStrLn "Wrong expression"          

