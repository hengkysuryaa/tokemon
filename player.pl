:- include('tokemon.pl').

:- dynamic(player/2). /* player(X,Y) */
:- dynamic(inventori/2). /* inventori(NamaTokemon,Health) */
:- dynamic(musuh/4). /* musuh(NamaLegend,Health,X,Y) */
:- dynamic(tokemon/4). /* tokemon(NamaTokemon,Health,X,Y) */

:- dynamic(maxInv/1).
:- dynamic(invCount/1).
:- dynamic(useSattack/1). /* dibattle init */
:- dynamic(nbLegend/1).

:- dynamic(startGame/1). /* bernilai 1 kalau game telah start */
:- dynamic(isGym/1). /* bernilai 0 kalo blm pernah ke gym, 1 kalau sudah di gym dan blm pernah pake heal/0, -1 kalo sdh pernah pakai heal */

quit :-
	\+startGame(_),
	write('start/0 dulu bosque'),!.
	
quit :- 
	/* literally retract semua dynamic */
	retract(maxInv(_)),
	retract(invCount(_)),
	retract(nbLegend(_)),
	retract(startGame(_)),!.
	/* retractTokemon, retractMusuh, retractInventori, retractPlayer,!. implementasi nanti kalo udh fix */

retractInventori :-
	\+inventori(_,_),!.

retractInventori :-
	retract(inventori(_,_)), retractInventori,!.

awal :-
	L is 15,
	T is 15,
	asserta(startGame(1)),
	random(1,L,X),
	random(1,T,Y),
	initMusuh(10),
	asserta(player(X,Y)),
	asserta(isGym(0)),
	asserta(useSattack(-1)), /* tiap pake diubah jadi 1 , kalo ganti tokemon pas battle reset ke 0 lagi */
	asserta(maxInv(6)), asserta(invCount(1)),
    health(pikacrot,A),asserta(inventori(pikacrot,A)),
    health(apimon,B),asserta(musuh(apimon,B,5,5)),
    health(airmon,C),assertz(musuh(airmon,C,7,7)),
/*	health(duarmon,D),asserta(tokemon(duarmon,D,8,8)), */
	asserta(nbLegend(2)),!.
	/* database tokemon liar blm health(duarmon,D),asserta(tokemon(duarmon,D,_,_)) , dst */




