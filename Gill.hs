import Data.List

main :: IO()
main =
    print (filter selector1 generator1)

number :: [Int] -> Int
number [] =
    0
number (x:xs) =
    x * 10 ^ length xs + number xs


generator1 :: [([ Int ] ,[ Int ] ,[ Int ]) ]
generator1
    = [ ([x1 , x2 , x3] ,[y1 , y2 , y3] ,[ z1 ,z2 ,z3]) | [x1 ,x2 ,x3 ,y1 ,y2 , y3 ,z1 ,z2 , z3, ignore] <- permutations [0..9]]

    
selector1 ::([ Int ] ,[ Int ] ,[ Int ]) -> Bool
selector1 (a_list,b_list,c_list)
    = 
    a >99 && b> 99 && c > 99
    && abs (a-b) == abs(c-b)
    && odd (a_list!!0 +a_list!!1+a_list!!2)
    && odd (b_list!!0 +b_list!!1+b_list!!2)
    && odd (c_list!!0 +c_list!!1+c_list!!2)
    && prime a && prime b && prime c 

    where
    a = number a_list
    b = number b_list
    c = number c_list

    prime n
        | n < 2 = False
        | otherwise = not ( factorisable n 2)
            where
            factorisable n f
                | n < f * f = False
                | otherwise = mod n f == 0
                    || factorisable n ( f + 1)