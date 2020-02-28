import System.IO
import Prelude hiding(head, (!!))

data Tree v a = 
      Leaf v a 
    | Branch v (Tree v a) (Tree  v a)


toList :: Tree v a -> [a]
toList (Leaf _ a) = [a]
toList (Branch v left right) = toList left ++  toList right

--annonation could v fetched simply
tag :: Tree v a -> v
tag (Leaf v _ ) = v 
tag (Branch v _ _) = v 


--head can be fetched easily
head :: Tree v a -> a 
head (Leaf _ a) = a
head (Branch _ x _) = head x 

type Size = Int  -- size of each internal node 


--expressions which gives constructors

--Leaf constructor with Size Annonation 
leaf :: a -> Tree Size a 
leaf a = Leaf 1 a

-- Branch constructor with size annonation
branch :: Tree Size a -> Tree Size a -> Tree Size a 
branch x y = Branch (tag x + tag y) x y

(!!) :: Tree Size a -> Int -> a 
(Leaf _ a) !! 0 = a
(Branch _ x y) !! n 
    | n < tag x     = x !! n 
    | otherwise     = y !! (n - tag x)





main :: IO ()
main = undefined 