main = print(x_warmup2 + x_generator2 + x_selector2)

x_unit x n
    = if x then n +1 else n
    
x_warmup2 :: Int
x_warmup2
    = n5
        where
        n1 = x_unit ( digits 0 == [0]) 0
        n2 = x_unit ( digits 5 == [5]) n1
        n3 = x_unit ( digits 47 == [4 ,7]) n2
        n4 = x_unit ( digits 620 == [6 ,2 ,0]) n3
        n5 = x_unit ( digits 2745 == [2 ,7 ,4 ,5]) n4


x_generator2 :: Int
x_generator2
    = n10
        where
        n1 = x_unit ( elem (14 ,17 ,27 ,13 ,24 ,29 ,23 ,19) generator2 ) 0
        n2 = x_unit ( elem (16 ,24 ,25 ,13 ,19 ,14 ,29 ,23) generator2 ) n1
        n3 = x_unit ( elem (17 ,27 ,28 ,13 ,24 ,23 ,25 ,14) generator2 ) n2
        n4 = x_unit ( elem (24 ,14 ,17 ,13 ,23 ,25 ,16 ,27) generator2 ) n3
        n5 = x_unit ( elem (29 ,28 ,14 ,13 ,23 ,18 ,19 ,16) generator2 ) n4
        n6 = x_unit ( notElem (14 ,24 ,13 ,13 ,27 ,25 ,17 ,29) generator2) n5
        n7 = x_unit ( notElem (13 ,31 ,25 ,13 ,17 ,14 ,23 ,27) generator2 ) n6
        n8 = x_unit ( notElem (25 ,17 ,19 ,13 ,25 ,24 ,28 ,29) generator2 ) n7
        n9 = x_unit ( notElem (16 ,19 ,14 ,13 ,18 ,18 ,19 ,28) generator2 ) n8
        n10 = x_unit ( notElem (13 ,14 ,18 ,13 ,25 ,29 ,16 ,25) generator2 ) n9


x_selector2 :: Int
x_selector2
    = n10
        where
        n1 = x_unit ( selector2 (19 ,31 ,29 ,16 ,25 ,23 ,28 ,27) ) 0
        n2 = x_unit (not ( selector2 (14 ,16 ,25 ,13 ,31 ,23 ,24 ,27) ) ) n1
        n3 = x_unit (not ( selector2 (14 ,24 ,27 ,13 ,23 ,16 ,17 ,31) ) ) n2
        n4 = x_unit (not ( selector2 (16 ,17 ,23 ,13 ,25 ,14 ,24 ,27) ) ) n3
        n5 = x_unit (not ( selector2 (16 ,27 ,18 ,13 ,25 ,14 ,19 ,31) ) ) n4
        n6 = x_unit (not ( selector2 (17 ,14 ,23 ,13 ,16 ,24 ,25 ,19) ) ) n5
        n7 = x_unit (not ( selector2 (17 ,16 ,14 ,13 ,25 ,19 ,24 ,31) ) ) n6
        n8 = x_unit (not ( selector2 (19 ,14 ,25 ,13 ,16 ,27 ,31 ,24) ) ) n7
        n9 = x_unit (not ( selector2 (19 ,25 ,14 ,13 ,16 ,31 ,24 ,23) ) ) n8
        n10 = x_unit (not ( selector2 (23 ,31 ,14 ,13 ,24 ,27 ,17 ,25) ) ) n9