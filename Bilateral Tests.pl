
x_unit(F, M, N) :-
	call( F ) -> N is M + 1; N is M.

x_warmup3(N5) :-
  x_unit( number( [] , 0) , 0 , N1 ) ,
  x_unit( number( [9] , 9) , N1 , N2 ) ,
  x_unit( number( [4 ,7] , 47) , N2 , N3 ) ,
  x_unit( number( [2 ,5 ,4] , 254) , N3 , N4 ) ,
  x_unit( number([9 ,8 ,7 ,6] , 9876) , N4 , N5 ) .

x_generator3( N10 ) :-
    x_unit(generator3([[1], [2 ,3 ,4 ,5 ,6 ,7 ,8 ,9]]) , 0 , N1 ),
    x_unit(generator3([[1 ,2 ,3 ,4 ,5 ,7] ,[9 ,8 ,6]] ) , N1 , N2 ) ,
    x_unit(generator3([[1 ,3 ,2 ,5] ,[4 ,8 ,9 ,7 ,6]] ) , N2 , N3 ) ,
    x_unit(generator3([[1 ,2 ,3] ,[6 ,4 ,9 ,8 ,5 ,7]] ) , N3 , N4 ) ,
    x_unit(generator3([[4 ,8 ,3 ,9 ,7 ,6] ,[1 ,2 ,5]] ) , N4 , N5 ) ,
    x_unit(\+ generator3([[9 ,2 ,5 ,4 ,8 ,3 ,1 ,7 ,6] ,[]]) , N5 , N6 ) ,
    x_unit(\+ generator3([[8 ,4 ,9 ,3 ,7] ,[1 ,2 ,5 ,8]] ) , N6 , N7 ) ,
    x_unit(\+ generator3([[7 ,8 ,6 ,4 ,9 ,3] ,[2 ,5]] ) , N7 , N8 ) ,
    x_unit(\+ generator3([[2] ,[2 ,5 ,9 ,8 ,3 ,4 ,7]] ) , N8 , N9 ) ,
    x_unit(\+ generator3([[] ,[1 ,2 ,6 ,3 ,9 ,5 ,4 ,7 ,8]]) , N9 , N10 ) .


x_selector3( N10 ) :-
  x_unit( selector3( [[1 ,7 ,6 ,9 ,5 ,4 ,8] ,[2 ,3]] ) , 0 , N1 ) ,
  x_unit( selector3( [[2 ,3] ,[1 ,7 ,6 ,9 ,5 ,4 ,8]] ) , N1 , N2 ) ,
  x_unit(\+ selector3( [[1 ,7] ,[9 ,6 ,4 ,8 ,3 ,5 ,2]] ) , N2 , N3 ) ,
  x_unit(\+ selector3( [[1 ,7] ,[4 ,2 ,8 ,3 ,5 ,2 ,6]] ) , N3 , N4 ) ,
  x_unit(\+ selector3( [[1 ,7 ,6 ,9 ,5 ,2 ,8] ,[4 ,3]] ) , N4 , N5 ) ,
  x_unit(\+ selector3( [[] ,[6 ,9 ,5 ,2 ,8 ,4 ,3 ,1 ,7]]) , N5 , N6 ) ,
  x_unit(\+ selector3( [[5 ,3 ,1 ,4 ,9] ,[8 ,2 ,6 ,7]] ) , N6 , N7 ) ,
  x_unit(\+ selector3( [[9 ,1 ,5 ,3 ,4] ,[7 ,6 ,8 ,2]] ) , N7 , N8 ) ,
  x_unit(\+ selector3( [[6 ,2 ,8 ,9] ,[5 ,4 ,3 ,1 ,7]] ) , N8 , N9 ) ,
  x_unit(\+ selector3( [[9 ,7 ,3 ,8 ,2 ,1 ,4 ,6 ,5] ,[]]) , N9 , N10 ) .

  main :-
    x_warmup3(A),
    x_generator3(B),
    x_selector3(C),
	T is A + B + C,
	write(T).