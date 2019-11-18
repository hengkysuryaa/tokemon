:- include('modifier.pl').
:- dynamic(myName/1).
:- dynamic(myHealth/1).
:- dynamic(myType/1).
:- dynamic(myAttack/1).
:- dynamic(mySAttack/1).

:- dynamic(enemyName/1).
:- dynamic(enemyHealth/1).
:- dynamic(enemyType/1).
:- dynamic(enemyAttack/1).

:- dynamic(isBattle/1).
:- dynamic(isRun/1).

/* ntar abis selesai battle atau jika pokemon kita mati harus di reset */
resetMyVar :-
    retract(myName(_)),retract(myHealth(_)), retract(myType(_)),retract(myAttack(_)),retract(mySAttack(_)),!.

resetEnemyVar :-
	 retract(enemyName(_)),retract(enemyHealth(_)), retract(myType(_)),retract(enemyAttack(_)),!.

resetAllVar :-
	resetMyVar, resetEnemyVar,!.

pick(X) :-
	\+inventori(X,_),write('You dont have '),write(X),!.

pick(X) :- 
    retract(useSattack(-1)),asserta(useSattack(0)),
    inventori(X,A),asserta(myName(X)),asserta(myHealth(A)),
    nattack(X,B),asserta(myAttack(B)), 
    sattack(X,C),asserta(mySAttack(C)),
    tipe(X,D),asserta(myType(D)),
    write('I choose you, '),
    write(X),
    write('!'),nl,nl,
	
	enemyName(Musuh),
	nattack(Musuh,P),asserta(enemyAttack(P)),
	tipe(Musuh,Q),asserta(enemyType(Q)),
    health(Musuh,R),asserta(enemyHealth(R)),
	show,!.

run :-
	\+isRun(1), write('Kamu sudah lari dari tokemon itu atau sedang melawan tokemon itu'),!.

run :- 
	isRun(1),
	random(1,5,X),random(1,5,Y),
	(
		(
			X =:= Y,
			write('You failed to run! Choose your Tokemon!'),nl,nl,
			fight

		);
		(
			write('You sucessfully escaped the Tokemon!'),nl,
			retract(isRun(1)), asserta(isRun(0))
		)
	),!.

fight :-
    statusToke,
	retract(isRun(1)), asserta(isRun(0)),
	retract(isBattle(0)), asserta(isBattle(1)),
	player(X,Y),musuh(Nama,_,X,Y,_),
	A = Nama, asserta(enemyName(A)),!.

/* Buat nama sama tipe tokemon yang dilawan belum */

optAttack :-
    write('Normal  : '),myAttack(A),write(A),nl,
    write('Special : '),mySAttack(B),write(B),!.
    
/* nilai myattack dan enemyattack pake modifier dl */
myAttack :-
    myHealth(Z),Z>0,myName(X),enemyName(Y),write(X),write(' dealt '),modifier(X,Y),myAttack(A),write(A),write(' damage to '),write(Y),nl,nl,
	enemyHealth(B),C is B-A,retract(enemyHealth(B)),asserta(enemyHealth(C)),
	enemyHealth(J),
		(
			
			(
				J=<0,
				retract(enemyHealth(_)),asserta(enemyHealth(0)),
				show,
				write('Kamu menang dalam battle ini'),
				menangBattle
			);
			(
				show
			)
		),!. 

enemyAttack:-
    enemyHealth(Z),Z>0,enemyName(X),write(X),write(' dealt '),enemyAttack(A),write(A),write(' damage to '),myName(Y),write(Y),nl,nl,
	myHealth(B),C is B-A,retract(myHealth(B)),asserta(myHealth(C)),
	myHealth(J),
		(
			
			(
				J=<0,
				retract(myHealth(_)),asserta(myHealth(0)),
				show,
				kalahBattle
			);
			(
				show
			)
		),!. 

enemyAttack :- !.

attack :-
	\+isBattle(1),
	write('Kamu tidak di battle!'),!.

attack :-
	isBattle(1),
	myHealth(X),enemyHealth(Y),X>0,Y>0,
	myAttack,
	enemyAttack,!.

sattack :-
	enemyHealth(Z),Z>0,useSattack(1),write('Kamu udah pakai special attack!'),!.
    
sattack :-
	enemyHealth(Z),Z>0,
	retract(useSattack(0)),asserta(useSattack(1)),
    myName(X),enemyName(Y),modifierS(X),write(X),
    write(' uses Special Attack!'),
    write(' It dealt '),mySAttack(A),write(A),write(' damage to '),write(Y),nl,nl,
	enemyHealth(B),C is B-A,retract(enemyHealth(B)),asserta(enemyHealth(C)),
	enemyHealth(J),
	(
			
		(
			J=<0,
			retract(enemyHealth(_)),asserta(enemyHealth(0)),
			show,
			write('Kamu menang dalam battle ini'),
			menangBattle
		);
		(
			show
		)
	),!. 

/* enemy gabisa special */ 

show :-
    write('Your Tokemon: '),nl,
    myName(X),write(X),nl,
    write('Health  : '),myHealth(A),write(A),nl,
    write('Type    : '),myType(B),write(B),nl,nl,
    
    write('Enemy Tokemon: '),nl,
    enemyName(Y),write(Y),nl,
    write('Health  : '),enemyHealth(C),write(C),nl,
    write('Type    : '),enemyType(D),write(D),nl,nl.

/*   nanti aja
battle:-
	initBattle,
    show.
*/

updateHealth(_) :-
	myHealth(A),
	A=<0,fail,!. /* bisa dikombinasikan dgn drop ketika tokemon kita mati */

updateHealth(X) :-
	myHealth(A),
	A>0,
	retract(inventori(X,_)),
	assertz(inventori(X,A)),!.

menang :- 
	asserta(isWin(1)),
	write('Kamu menang dlm game ini'),
	quit,!.

kalah :-
	(
		invCount(X), X =:= 0,
		asserta(isWin(0)),
		write('Kamu kalah dlm game ini'),
		quit
	),!.

kalah :- !.

kalahBattle :-

	(
		invCount(X), X =:= 0,
		retract(useSattack(_)),asserta(useSattack(-1)),
		kalah
	);
	(
		myName(X),
		drop(X),
		invCount(A), A > 0,
		write('Kamu kalah dalam battle ini'),nl,nl,
		/* isBattle masih 1 shg hanya bisa pick */
		write('Kamu harus memilih pokemon lain di inventorimu untuk melawan musuh!'),
		retract(useSattack(_)),asserta(useSattack(-1)),
		resetMyVar
	)
	,!.

kalahBattle :- !.

menangBattle :- 

	(
		nbLegend(X), X =:= 0,
		retract(useSattack(_)),asserta(useSattack(-1)),
		menang
	);
	(
		retract(useSattack(_)),asserta(useSattack(-1)),
		myName(Y), 
		updateHealth(Y)
	),!.

menangBattle :- !.

