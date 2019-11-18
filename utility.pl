printStatusN([]) :- !.
printStatusN([H|Tail]) :-
	write(H),nl,
	write('Health: '),inventori(H,X),write(X),nl,
	write('Tipe: '),tipe(H,Y),write(Y),nl,nl,
	printStatusN(Tail),!.

printStatusL([]) :- !.
printStatusL([H|Tail]) :-
	write(H),nl,
	write('Health: '),musuh(H,X,_,_,_),write(X),nl,
	write('Tipe: '),tipe(H,Y),write(Y),nl,nl,
	printStatusL(Tail),!.

countInvCap(T) :-
	T == apimon, nbLegend(A), B is A-1,retract(nbLegend(A)),asserta(nbLegend(B)),
	invCount(A),B is A+1,retract(invCount(A)),asserta(invCount(B)).
countInvCap(T) :-
	T == airmon, nbLegend(C), D is C-1,retract(nbLegend(C)),asserta(nbLegend(D)),
	invCount(A),B is A+1,retract(invCount(A)),asserta(invCount(B)).
countInvCap(_) :-
	invCount(A),B is A+1,retract(invCount(A)),asserta(invCount(B)).

countInvDrop(T) :-
	T == apimon, nbLegend(A), B is A+1,retract(nbLegend(A)),asserta(nbLegend(B)),
	invCount(A),B is A-1,retract(invCount(A)),asserta(invCount(B)). 
countInvDrop(T) :-
	T == airmon, nbLegend(A), B is A+1,retract(nbLegend(A)),asserta(nbLegend(B)),
	invCount(A),B is A-1,retract(invCount(A)),asserta(invCount(B)). 
countInvDrop(_) :-
	invCount(A),B is A-1,retract(invCount(A)),asserta(invCount(B)). 
