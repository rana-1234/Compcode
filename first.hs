import System.IO 

data BinarySearchTree a = None | Node (BinarySearchTree a) (BinarySearchTree a) (Int) deriving (Show)

type BinarySearchTreeInt = BinarySearchTree Int 

insertInt :: BinarySearchTreeInt -> Int -> BinarySearchTreeInt
insertInt None value = Node None None value
insertInt (Node left right value) val 
    | val > value = Node left (insertInt right val ) value 
    | val < value = Node (insertInt left val) right value 
    | otherwise = Node left right value


searchInt :: BinarySearchTreeInt -> Int -> Bool 
searchInt None _ = False
searchInt (Node left right value ) val 
    | val == value = True 
    | val > value = searchInt right val -- search in right subtree
    | otherwise = searchInt left val  -- search in left subtree 

deleteInt :: BinarySearchTreeInt -> Int -> BinarySearchTreeInt
deleteInt None _ = None
deleteInt (Node left right value) val = undefined --implement later

hieghtInt :: BinarySearchTreeInt -> Int 
hieghtInt None = 0 
hieghtInt (Node left right _) = 1 + max (hieghtInt left) (hieghtInt right)  


main :: IO ()
main = do 
    putStrLn "Hey this is the binary search tree implemenatation"