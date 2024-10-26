main :- generator3( X ) , selector3( X ) , write( X ) .

partition(0, List, [], List).
partition(SplitIndex, [H|T], [H|Part1], Part2) :-
    SplitIndex > 0,
    Decremented is SplitIndex - 1,
    partition(Decremented, T, Part1, Part2).


number([], 0).
number([X|Xs], Out) :-
    number(Xs, Tail),
    length(Xs,Len),
    Out is X*(10^ Len ) + Tail .


generator3([Part1, Part2]) :-
    permutation([1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9], X ),
    length(X, Len),
    NewLen is Len -1,
    between(1, NewLen, SplitIndex),
    partition(SplitIndex, X, Part1, Part2).

checkLastIs3(Len1, Len2, Last1, Last2) :-
    (Len1 < Len2 -> Last1 == 3 ; Len2 < Len1 -> Last2 == 3).

palindrome(Number) :-
    number_chars(Number, DigitList), 
    reverse(DigitList, ReversedList),
    DigitList = ReversedList.   % Check if the original and reversed lists are the same

firstDigit(Number,Out):-
    number_chars(Number, DigitList),
    nth0(0,DigitList,Out).

selector3([Part1,Part2]) :-
	number(Part1,Num1),
    number(Part2,Num2),
    length(Part1,Len1),
    length(Part2,Len2),
    nth1(Len1, Part1, Last1),
    nth1(Len2,Part2,Last2),
    checkLastIs3(Len1,Len2,Last1,Last2),
    Prod is Num1 * Num2,
    Add is Num1+Num2+100,
    firstDigit(Prod,FirstDig),
    FirstDig = '4',
    palindrome(Prod),
    palindrome(Add).
    

