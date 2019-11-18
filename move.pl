:- include('player.pl').


w :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

w :- isBattle(0),isFight(0),utara,moveMusuh,\+ checkPosition,posGym,map,!.

w :- isBattle(1),write('Kamu sedang dalam pertarungaan!'),!.

w :- isFight(1),write('Kamu sedang dalam pertarungaan!'),!.

a :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

a :- isBattle(0),isFight(0),barat,moveMusuh,\+ checkPosition,posGym,map,!.

a :- isBattle(1),write('Kamu sedang dalam pertarungaan!'),!.

a :- isFight(1),write('Kamu sedang dalam pertarungaan!'),!.

s :- \+startGame(_),
	write('Perintah hanya dapat dijalanaat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

s :- isBattle(0),isFight(0),selatan,moveMusuh,\+ checkPosition,posGym,map,!.

s :- isBattle(1),write('Kamu sedang dalam pertarungaan!'),!.

s :- isFight(1),write('Kamu sedang dalam pertarungaan!'),!.

d :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

d :- isBattle(0),isFight(0),timur,moveMusuh,\+ checkPosition,posGym,map,!.

d :- isBattle(1),write('Kamu sedang dalam pertarungaan!'),!.

d :- isFight(1),write('Kamu sedang dalam pertarungaan!'),!.

utara :- 
	player(_,Y), Y =:= 1,
	write(' ##### Tembok brooo! #####'),nl,!.
/*
utara :- 
	player(X,Y), Yi is Y-1, X =:= 8, Yi =:= 8,
	write('Kamu berada di Gym !'),(isGym(0) -> isGym(1) ; isGym(-1)),!.
*/
utara :- 
	retract(player(X,Y)),
	Y > 1,
	NewY is Y-1,
	write([X,NewY]),nl,
	asserta(player(X,NewY)),!.

selatan :- 
	player(_,Y), mapYLength(BatasBawah), Y =:= BatasBawah,
	write(' ##### Tembok brooo! #####'),nl,!.

selatan :- 
	retract(player(X,Y)),
	Y < 15,
	NewY is Y+1,
	write([X,NewY]),nl,
	asserta(player(X,NewY)),!.

timur :- 
	player(X,_), mapXLength(BatasSamping), X =:= BatasSamping,
	write(' ##### Tembok brooo! #####'),nl,!.

timur :- 
	retract(player(X,Y)),
	X < 15,
	NewX is X+1,
	write([NewX,Y]),nl,
	asserta(player(NewX,Y)),!.

barat :- 
	player(X,_), X =:= 1,
	write(' ##### Tembok brooo! #####'),nl,!.

barat :- 
	retract(player(X,Y)),
	X > 1,
	NewX is X-1,
	write([NewX,Y]),nl,
	asserta(player(NewX,Y)),!.

posGym :- player(X,Y), X =:= 8, Y =:= 8, isGym(0), retract(isGym(0)), asserta(isGym(1)).
posGym :- player(X,_), X \= 8, isGym(1), retract(isGym(1)), asserta(isGym(-1)).
posGym :- player(_,Y), Y \= 8, isGym(1), retract(isGym(1)), asserta(isGym(-1)).
posGym :- player(_,_).

moveMusuh :- 
		findall(A,musuh(A,_,_,_,_),ListMusuh),
		listLength(ListMusuh,Len),
		forall(between(0,Len,I),(
			getByIndex(ListMusuh,I,Nama),
			randomMove(Nama)
		)),!.

moveMusuh :- !.


randomMove(Nama) :- random(1,20,Pos),gerakbasedPos(Pos,Nama),!.

gerakbasedPos(Pos,Nama) :- Pos =< 5, utaraMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 5,Pos =< 10, timurMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 10,Pos =< 15, selatanMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 15,Pos =< 20, baratMusuh(Nama).

utaraMusuh(Nama) :- 
	musuh(Nama,_,_,Y,_), Y =:= 1,
	randomMove(Nama),!.

utaraMusuh(Nama) :- 
	musuh(Nama,_,X,Y,_), Yi is Y-1, X is 8, Yi is 8,
	randomMove(Nama),!.

utaraMusuh(Nama) :-
	musuh(Nama,_,X,Y,_),Yi is Y-1, musuh(_,_,X,Yi,_),
	randomMove(Nama),!.

utaraMusuh(Nama) :- 
	musuh(Nama,Health,X,Y,T),
	retract(musuh(Nama,Health,X,Y,T)),
	Y > 1,
	NewY is Y-1,
	asserta(musuh(Nama,Health,X,NewY,T)),!.

timurMusuh(Nama) :- 
	musuh(Nama,_,X,_,_), X =:= 15,
	randomMove(Nama),!.

timurMusuh(Nama) :- 
	musuh(Nama,_,X,Y,_), Xi is X+1, Xi is 8, Y is 8,
	randomMove(Nama),!.

timurMusuh(Nama) :-
	musuh(Nama,_,X,Y,_), Xi is X+1, musuh(_,_,Xi,Y,_),
	randomMove(Nama),!.

timurMusuh(Nama) :- 
	musuh(Nama,Health,X,Y,T),
	retract(musuh(Nama,Health,X,Y,T)),
	X < 15,
	NewX is X+1,
	asserta(musuh(Nama,Health,NewX,Y,T)),!.

selatanMusuh(Nama) :- 
	musuh(Nama,_,_,Y,_), Y =:= 15,
	randomMove(Nama),!.

selatanMusuh(Nama) :- 
	musuh(Nama,_,X,Y,_), Yi is Y+1, X is 8, Yi is 8,
	randomMove(Nama),!.

selatanMusuh(Nama) :-
	musuh(Nama,_,X,Y,_), Yi is Y+1, musuh(_,_,X,Yi,_),
	randomMove(Nama),!.

selatanMusuh(Nama) :- 
	musuh(Nama,Health,X,Y,T),
	retract(musuh(Nama,Health,X,Y,T)),
	Y < 15,
	NewY is Y+1,
	asserta(musuh(Nama,Health,X,NewY,T)),!.

baratMusuh(Nama) :- 
	musuh(Nama,_,X,_,_), X =:= 1,
	randomMove(Nama),!.

baratMusuh(Nama) :- 
	musuh(Nama,_,X,Y,_), Xi is X-1, Xi is 8, Y is 8,
	randomMove(Nama),!.

baratMusuh(Nama) :-
	musuh(Nama,_,X,Y,_), Xi is X-1, musuh(_,_,Xi,Y,_),
	randomMove(Nama),!.

baratMusuh(Nama) :- 
	musuh(Nama,Health,X,Y,T),
	retract(musuh(Nama,Health,X,Y,T)),
	X > 1,
	NewX is X-1,
	asserta(musuh(Nama,Health,NewX,Y,T)),!.

