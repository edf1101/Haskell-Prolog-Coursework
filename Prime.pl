check_weekday(CheckDay,TargetDay, Start) :-
    DayIndex is (Start + CheckDay - 2) mod 7 + 1,
    DayIndex == TargetDay. 

mondays(MonthLen, Start, Out) :-
    findall(Day, (between(1, MonthLen, Day), check_weekday(Day,1, Start)), Out).  

daysInMonth(MonthInd,Leap,Out) :-
    Feb is 28 + Leap,
    Months = [31, Feb ,31,30,31,30,31,31,30,31,30,31],
    nth1(MonthInd,Months,Out).

generator4([[Month1,MonthLen1,StartDay1],[Month2,MonthLen2,StartDay2]]) :-
    between(1,7,StartDay1),
    between(1,12,Month1),
    between(0,1,LeapYear),
    daysInMonth(Month1,LeapYear,MonthLen1),
    Month2 is (Month1 + 1) mod 12,
    daysInMonth(Month2,LeapYear,MonthLen2),
    StartDay2 is ((StartDay1 - 1 + MonthLen1) mod 7) + 1.

lengthOfName(MonthInd,Out) :-
    Months = [7, 8, 5, 5, 3, 4, 4, 6, 9, 7, 8, 8],
    nth1(MonthInd,Months,Out).

primeSaturdays(MonthLen,Start,Out) :-
    findall(Day, (between(1, MonthLen, Day), (prime(Day),check_weekday(Day,6, Start))), List),
    length(List,Out).

primeDays(MonthLen,Out) :-
    findall(Day, (between(1, MonthLen, Day), (prime(Day))), List),
    length(List,Out).

selector4([[Month1,MonthLen1,StartDay1],[Month2,MonthLen2,StartDay2]]) :-
    not(MonthLen1 = MonthLen2),
    mondays(MonthLen1,StartDay1,Mons1),
    length(Mons1,MonCount1),
    mondays(MonthLen2,StartDay2,Mons2),
    length(Mons2,MonCount2),
    not(MonCount1 = MonCount2),
    primeDays(MonthLen1,PrimeDays1),
    primeDays(MonthLen2,PrimeDays2),
    not(PrimeDays1 = PrimeDays2),
    primeSaturdays(MonthLen1,StartDay1,PrimeSat1),
    primeSaturdays(MonthLen2,StartDay2,PrimeSat2),
    not(PrimeSat1 = PrimeSat2),
    lengthOfName(Month1,NameLen1),
    lengthOfName(Month2,NameLen2),
    not(NameLen1 = NameLen2),
    T1 is MonthLen1 + MonCount1 + PrimeDays1 + PrimeSat1 + NameLen1,
    T2 is MonthLen2 + MonCount2 + PrimeDays2 + PrimeSat2 + NameLen2,
    prime(T1),
    prime(T2).
    

% This function  prime is taken from the lectures 
prime(N)
	:- N > 1 , \+ factorisable(2 , N ) .
factorisable(F, N )
	:- F * F =< N ,
	0 is N mod F .
factorisable(F , N )
	:- F * F =< N ,
	F1 is F + 1 ,
	factorisable( F1 , N ) .

main:- generator4( X ) , selector4( X ) , write( X ) .