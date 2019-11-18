:- dynamic(mapXLength/1).
:- dynamic(mapYLength/1).

create_peta :- 	X is 15,
				Y is 15,
				asserta(mapXLength(X)),asserta(mapYLength(Y)).

borderAtas(_,Y) 		:- Y=:=0 , !.
borderKiri(X,_) 		:- X=:=0 , !.
borderBawah(_,Y) 		:- mapYLength(T) , YMax is T+1 , Y=:=YMax , !.
borderKanan(X,_) 		:- mapXLength(L) , XMax is L+1 , X=:=XMax , !.
playerCoordinate(X,Y)	:- player(X,Y), ! . 
enemyCoordinate(X,Y)    :- musuh(_,_,X,Y), !.
gymCoordinate(X,Y)		:- X is 8, Y is 8, !.


printPixel(X,Y) :- borderKanan(X,Y), borderAtas(X,Y), ! , write('XX').
printPixel(X,Y) :- borderKanan(X,Y), borderBawah(X,Y) , ! , write('XX').
printPixel(X,Y) :- borderKanan(X,Y) , ! , write(' X').
printPixel(X,Y) :- borderKiri(X,Y) , ! , write(' X').
printPixel(X,Y) :- borderAtas(X,Y) , ! , write('XX').
printPixel(X,Y) :- borderBawah(X,Y) , ! , write('XX').
printPixel(X,Y) :- playerCoordinate(X,Y), ! , write(' P').
printPixel(X,Y) :- enemyCoordinate(X,Y), ! , write(' E').
printPixel(X,Y) :- gymCoordinate(X,Y), ! , write(' G').  
printPixel(_,_) :- write(' -').


map :- 	startGame(_),create_peta,
		mapXLength(L),mapYLength(T),
		XMin is 0, XMax is L+1,
		YMin is 0, YMax is T+1, 
		forall(between(YMin,YMax,J),(
			forall(between(XMin,XMax,I),(
				printPixel(I,J)
			)),
		nl
		)),nl,!.
map :- 
		write('Kau belum start bosque !'),nl,!.


betweenToList(X,X,[X]) 		:- !.
betweenToList(X,Y,[X|Tail])	:- X < Y, Z is X+1, betweenToList(Z,Y,Tail).

listLength([],0).
listLength([_|Tail], Count):-
    listLength(Tail, PartialCount),
    Count is PartialCount+1.


randomCoordinate(X,Y) :- 
	random(1,225,A),
	X is (A div 15) + 1, setCoor(A,Y), !.
setCoor(A,Y) :-  A =:= 15, Y is A.
setCoor(A,Y) :-  Y is (A mod 15).



getByIndex([X], 0, X).
getByIndex([H|_], 0, H).
getByIndex([_|T], I, E) :- NewIndex is I-1, getByIndex(T, NewIndex, E).


initMusuh(0) :- !.
initMusuh(N) :- 
	randomCoordinate(X,Y),
	findall(A,tokenemy(A),ListEnemy),
/*	write(ListEnemy), */
	listLength(ListEnemy,Len),
	random(0,Len,Number),
	getByIndex(ListEnemy, Number, B),
	health(B,H), 
	asserta(musuh(B,H,X,Y)),
/*	write(X),nl,
	write(Y),nl, */
	N1 is N-1,
	initMusuh(N1), !.

print :- forall(musuh(P,_,_,_), write(P)).