import System.IO
import Data.List

add :: Int -> Int -> Int
add x y = x+y
main :: IO()
main = do
    let list = [1 .. 10]
        newList = list >>= (\x -> [x*3]) >>= (\y -> if y `mod` 2 == 0 then [(True , y)] else [(False,y)])
        z = 12 :: Int
        t = 13 :: Int
    putStrLn (show newList)