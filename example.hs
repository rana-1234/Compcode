{--
In this example, consider a computation that requires some sort of resource. 
If the resource is available, computation proceeds; when the resource is unavailable, 
the computation suspends. We use the type R to denote a computation 
using resources controlled by our monad. The definition of R is as follows:
--}


data Resource = Resource  --Some resource may be keyboard

data R a =  R (Resource -> (Resource, Either a (R a)))

instance Monad R where 
    R c1 >>= fc2          = R (\r -> case c1 r of
                                (r', Left v)    -> let R c2 = fc2 v in
                                                     c2 r'
                                (r', Right pc1) -> (r', Right (pc1 >>= fc2)))
    return v              = R (\r -> (r, (Left v)))

main :: IO ()
main = undefined 
