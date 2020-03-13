{-# LANGUAGE GADTs       #-}

-- data Expr =
--     I Int
--     | Add Expr Expr
--     | Mul Expr Expr
--     deriving (Show)

-- add :: Expr -> Expr -> Expr
-- add (I x) (I y) = I (x + y)
-- add _ _ = undefined

-- mul :: Expr -> Expr -> Expr
-- mul (I x ) ( I y) = I (x*y)
-- mul _ _ = undefined

-- evaluate :: Expr -> Expr
-- evaluate (I x) = (I x)
-- evaluate (Add x y) =  add  (evaluate x) (evaluate y)
-- evaluate (Mul x y) = mul (evaluate x) (evaluate y)

-- eval :: Expr -> Int
-- eval (I x) = x
-- eval (Add x y) = eval x  + eval y
-- eval (Mul x y) = eval x  * eval y

-- this works fine till we have only integer and all.
-- but what if we have Bool types also in expression ?

-- for e.g. let say data Expr = B Bool | Eq Expr Expr -- Now (2 + 3) == 5 evaluates to true and (2 + 3 ) == 6 evaluates to false

-- So the eval becomes Expr -> Either Int Bool
-- but what if we get invalid expression , e.g. True + 5 => Add (B True) (I 5) which does not make sense
-- so further the return expr return type would be  eval :: Expr -> Maybe (Either Int Bool)


--use of smart constructor and phantom variables to restrict the user from writing invalid expression

-- data Exp a = I Int  --used a to indicate the expression type. For e.g. Exp Int , Exp Bool , Exp Float etc.
--     | B Bool
--     | Add (Exp a) (Exp a)
--     | Mul (Exp a) (Exp a)
--     | Eq  (Exp a) (Exp a)
--     deriving (Show)


-- --Use of smart constructor


-- --Add :: Exp a -> Exp a -> Exp a
-- add :: Exp Int -> Exp Int -> Exp Int
-- add = Add

-- --Mul :: Exp a -> Exp a -> Exp a
-- mul :: Exp Int -> Exp Int -> Exp Int
-- mul = Mul

-- --Eq :: Exp a -> Exp a -> Exp a
-- eq :: Exp Bool -> Exp Bool -> Exp Bool
-- eq = Eq

-- i :: Int -> Exp Int
-- i = I

-- b :: Bool -> Exp Bool
-- b = B

-- -- now the expression will not be evaluated (b True `add` i 5), because b True -> Exp Bool , and i 5 -> Exp Int, there is no function add which takes Exp Int and Exp Bool to add

-- eval :: Exp a -> a
-- eval (I n) = n -- problem because Exp a -> a , here a is rigid type But eval (I n) = n -> n is not a rigid type, this problem is solved by GADTs
-- eval _ = undefined
-- -- eval (B x) = x
-- -- eval (I x) = x
-- --eval (Eq x y) =


--The exact same thing is done by the GADTs for that use language features {-# LANGUAGE GADTs #-}

data Exp a  where
    I :: Int -> Exp Int
    B :: Bool -> Exp Bool
    Add :: Exp Int -> Exp Int -> Exp Int
    Mul :: Exp Int -> Exp Int -> Exp Int
    Eq :: (Eq a ) => Exp a -> Exp a -> Exp Bool


eval :: Exp a -> a
eval (I x) = x --  Now the compiler is able to infer the type of x as Int, because I takes and Int (I :: Int -> Exp Int) 
eval (B x) = x -- Same for Bool
eval (Add exp1 exp2) = eval exp1 + eval exp2
eval (Mul exp1 exp2) = eval exp1 * eval exp2
eval (Eq exp1  exp2) = eval exp1 == eval exp2


