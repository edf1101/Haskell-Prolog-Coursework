main:-
    x_warmup4(A),
    x_generator4(B),
    x_selector4(C),
    T is A + B + C,
    write(T).

x_warmup4( N5 ) :-
	x_unit( mondays(31 ,4 ,[5 ,12 ,19 ,26]) , 0 , N1 ) ,
    x_unit( mondays(30 ,1 ,[1 ,8 ,15 ,22 ,29]) , N1 , N2 ) ,
    x_unit( mondays(31 ,6 ,[3 ,10 ,17 ,24 ,31]) , N2 , N3 ) ,
    x_unit( mondays(28 ,7 ,[2 ,9 ,16 ,23]) , N3 , N4 ) ,
    x_unit( mondays(30 ,2 ,[7 ,14 ,21 ,28]) , N4 , N5 ) .

x_generator4( N10 ):-
    x_unit( generator4([[ 1 ,31 ,1] ,[ 2 ,28 ,4]]) , 0 , N1 ) ,
    x_unit( generator4([[ 1 ,31 ,6] ,[ 2 ,29 ,2]]) , N1 , N2 ) ,
    x_unit( generator4([[ 2 ,29 ,5] ,[ 3 ,31 ,6]]) , N2 , N3 ) ,
    x_unit( generator4([[ 8 ,31 ,5] ,[ 9 ,30 ,1]]) , N3 , N4 ) ,
    x_unit( generator4([[12 ,31 ,4] ,[ 1 ,31 ,7]]) , N4 , N5 ) ,
    x_unit(\+ generator4([[11 ,30 ,2] ,[12 ,31 ,3]]) , N5 , N6 ) ,
    x_unit(\+ generator4([[ 6 ,20 ,3] ,[11 ,30 ,3]]) , N6 , N7 ) ,
    x_unit(\+ generator4([[12 ,31 ,4] ,[11 ,30 ,2]]) , N7 , N8 ) ,
    x_unit(\+ generator4([[ 9 ,30 ,1] ,[ 5 ,29 ,2]]) , N8 , N9 ) ,
    x_unit(\+ generator4([[ 7 ,31 ,3] ,[ 8 ,31 ,7]]) , N9 , N10 ) .

x_selector4( N10 ):- 
    x_unit( selector4([[ 2 ,29 ,1] ,[ 3 ,31 ,2]]) , 0 , N1 ) ,
  x_unit( selector4([[ 2 ,29 ,5] ,[ 3 ,31 ,6]]) , N1 , N2 ) ,
  x_unit(\+ selector4([[ 1 ,31 ,5] ,[ 2 ,28 ,1]]) , N2 , N3 ) ,
  x_unit(\+ selector4([[ 1 ,31 ,7] ,[ 2 ,29 ,3]]) , N3 , N4 ) ,
  x_unit(\+ selector4([[ 2 ,29 ,6] ,[ 3 ,31 ,7]]) , N4 , N5 ) ,
  x_unit(\+ selector4([[ 2 ,29 ,4] ,[ 3 ,31 ,5]]) , N5 , N6 ) ,
  x_unit(\+ selector4([[ 6 ,30 ,2] ,[ 7 ,31 ,4]]) , N6 , N7 ) ,
  x_unit(\+ selector4([[ 8 ,31 ,3] ,[ 9 ,30 ,6]]) , N7 , N8 ) ,
  x_unit(\+ selector4([[10 ,31 ,3] ,[11 ,30 ,6]]) , N8 , N9 ) ,
  x_unit(\+ selector4([[10 ,31 ,7] ,[11 ,30 ,3]]) , N9 , N10 ) .

x_unit( F , M , N ) :- 
    call( F ) -> N is M + 1; N is M .