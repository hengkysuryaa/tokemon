:- include('player.pl').


w :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

w :- utara,moveMusuh.

a :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

a :- barat,moveMusuh.

s :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

s :- selatan,moveMusuh.

d :- \+startGame(_),
	write('Perintah hanya dapat dijalankan saat permainan telah dimulai!'),nl,
	write('Mulai permainan terlebih dahulu : start.'),nl,!.

d :- timur,moveMusuh.


utara :- 
	player(_,Y), Y =:= 1,
	write('Tembok brooo!'),!.

utara :- 
	retract(player(X,Y)),
	Y > 1,
	NewY is Y-1,
	write([X,NewY]),nl,
	asserta(player(X,NewY)),!.

selatan :- 
	player(_,Y), mapYLength(BatasBawah), Y =:= BatasBawah,
	write('Tembok brooo!'),!.

selatan :- 
	retract(player(X,Y)),
	Y < 15,
	NewY is Y+1,
	write([X,NewY]),nl,
	asserta(player(X,NewY)),!.

timur :- 
	player(X,_), mapXLength(BatasSamping), X =:= BatasSamping,
	write('Tembok brooo!'),!.

timur :- 
	retract(player(X,Y)),
	X < 15,
	NewX is X+1,
	write([NewX,Y]),nl,
	asserta(player(NewX,Y)),!.

barat :- 
	player(X,_), X =:= 1,
	write('Tembok brooo!'),!.

barat :- 
	retract(player(X,Y)),
	X > 1,
	NewX is X-1,
	write([NewX,Y]),nl,
	asserta(player(NewX,Y)),!.

moveMusuh :- 
		findall(A,musuh(A,_,_,_),ListMusuh),
		listLength(ListMusuh,Len),
		forall(between(0,Len,I),(
			getByIndex(ListMusuh,I,Nama),
			randomMove(Nama)
		)), ! .


randomMove(Nama) :- random(1,20,Pos),gerakbasedPos(Pos,Nama),!.

gerakbasedPos(Pos,Nama) :- Pos =< 5, utaraMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 5,Pos =< 10, timurMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 10,Pos =< 15, selatanMusuh(Nama).
gerakbasedPos(Pos,Nama) :- Pos >= 15,Pos =< 20, baratMusuh(Nama).

utaraMusuh(Nama) :- 
	musuh(Nama,_,_,Y), Y =:= 1,
	randomMove(Nama),!.

utaraMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Yi is Y-1, player(X,Yi),
	randomMove(Nama),!.

utaraMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Yi is Y-1, X is 8, Yi is 8,
	randomMove(Nama),!.

utaraMusuh(Nama) :-
	musuh(Nama,_,X,Y),Yi is Y-1, musuh(_,_,X,Yi),
	randomMove(Nama),!.

utaraMusuh(Nama) :- 
	musuh(Nama,Health,X,Y),
	retract(musuh(Nama,Health,X,Y)),
	Y > 1,
	NewY is Y-1,
	asserta(musuh(Nama,Health,X,NewY)),!.

timurMusuh(Nama) :- 
	musuh(Nama,_,X,_), X =:= 15,
	randomMove(Nama),!.

timurMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Xi is X+1, player(Xi,Y),
	randomMove(Nama),!.

timurMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Xi is X+1, Xi is 8, Y is 8,
	randomMove(Nama),!.

timurMusuh(Nama) :-
	musuh(Nama,_,X,Y), Xi is X+1, musuh(_,_,Xi,Y),
	randomMove(Nama),!.

timurMusuh(Nama) :- 
	musuh(Nama,Health,X,Y),
	retract(musuh(Nama,Health,X,Y)),
	X < 15,
	NewX is X+1,
	asserta(musuh(Nama,Health,NewX,Y)),!.

selatanMusuh(Nama) :- 
	musuh(Nama,_,_,Y), Y =:= 15,
	randomMove(Nama),!.

selatanMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Yi is Y+1, player(X,Yi),
	randomMove(Nama),!.

selatanMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Yi is Y+1, X is 8, Yi is 8,
	randomMove(Nama),!.

selatanMusuh(Nama) :-
	musuh(Nama,_,X,Y), Yi is Y+1, musuh(_,_,X,Yi),
	randomMove(Nama),!.

selatanMusuh(Nama) :- 
	musuh(Nama,Health,X,Y),
	retract(musuh(Nama,Health,X,Y)),
	Y < 15,
	NewY is Y+1,
	asserta(musuh(Nama,Health,X,NewY)),!.

baratMusuh(Nama) :- 
	musuh(Nama,_,X,_), X =:= 1,
	randomMove(Nama),!.

baratMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Xi is X-1, player(Xi,Y),
	randomMove(Nama),!.

baratMusuh(Nama) :- 
	musuh(Nama,_,X,Y), Xi is X-1, Xi is 8, Y is 8,
	randomMove(Nama),!.

baratMusuh(Nama) :-
	musuh(Nama,_,X,Y), Xi is X-1, musuh(_,_,Xi,Y),
	randomMove(Nama),!.

baratMusuh(Nama) :- 
	musuh(Nama,Health,X,Y),
	retract(musuh(Nama,Health,X,Y)),
	X > 1,
	NewX is X-1,
	asserta(musuh(Nama,Health,NewX,Y)),!.

