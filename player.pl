:- include('tokemon.pl').

:- dynamic(player/2). /* player(X,Y) */
:- dynamic(inventori/2). /* inventori(NamaTokemon,Health) */
:- dynamic(musuh/5). /* musuh(NamaLegend,Health,X,Y,legend/normal) */

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
	retract(isGym(_)),
	retract(useSattack(_)),
	resetAllVar,
	retract(mapXLength(_)),
	retract(mapYLength(_)),
	retract(tokenemy(_)),
	retract(startGame(_)),!.
	/* retractTokemon, retractMusuh, retractInventori, retractPlayer,!. implementasi nanti kalo udh fix */

retractInventori :-
	\+inventori(_,_),!.

retractInventori :-
	retract(inventori(_,_)), retractInventori,!.

retractMusuh :-
	\+musuh(_,_,_,_,_),!.

retractMusuh :-
	retract(musuh(_,_,_,_,_)), retractMusuh,!.

retractPlayer :-
	\+player(_,_),!.

retractPlayer :-
	retract(player(_,_)), retractPlayer,!.

awal :-
	L is 15,
	T is 15,
	asserta(startGame(1)),
	asserta(isBattle(0)),
	asserta(isRun(0)),
	random(1,L,X),
	random(1,T,Y),
	initEnemy,
	initMusuh(10),
	asserta(player(X,Y)),
	asserta(isGym(0)),
	asserta(useSattack(-1)), /* tiap pake diubah jadi 1 , kalo ganti tokemon pas battle reset ke 0 lagi */
	asserta(maxInv(6)), asserta(invCount(1)),
    health(pikacrot,A),asserta(inventori(pikacrot,A)),
	asserta(nbLegend(2)),!.




