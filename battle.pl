:- dynamic(myName/1).
:- dynamic(myHealth/1).
:- dynamic(myType/1).
:- dynamic(myAttack/1).
:- dynamic(mySAttack/1).

:- dynamic(enemyName/1).
:- dynamic(enemyHealth/1).
:- dynamic(enemyType/1).
:- dynamic(enemyAttack/1).

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
    retract(useSattack(_)),asserta(useSattack(0)),
    inventori(X,A),asserta(myName(X)),asserta(myHealth(A)),
    nattack(X,B),asserta(myAttack(B)), 
    sattack(X,C),asserta(mySAttack(C)),
    tipe(X,D),asserta(myType(D)),
    write('I choose you, '),
    write(X),
    write('!'),nl,nl,
/*  kalo mau ngetes pake musuh sementara pake yg bawah  jgn lupa !. yg atas didelete 
	asserta(enemyName(slowbro)),
	asserta(enemyAttack(100)),
	asserta(enemyType(water)),
    asserta(enemyHealth(150)) */
	show,!.
   

run :- 
	random(1,5,X),random(1,5,Y),
	(
		(
			X =:= Y,
			write('You failed to run! Choose your Tokemon!'),nl,nl,
			fight

		);
		(
			write('You sucessfully escaped the Tokemon!'),nl
		)
	),!.

fight :-
    statusToke,!.

/* Buat nama sama tipe tokemon yang dilawan belum */

optAttack :-
    write('Normal  : '),myAttack(A),write(A),nl,
    write('Special : '),mySAttack(B),write(B),!.
    
/* nilai myattack dan enemyattack pake modifier dl */
myAttack :-
    myHealth(Z),Z>0,myName(X),write(X),write(' dealt '),modifier(X),myAttack(A),write(A),write(' damage to '),enemyName(Y),write(Y),nl,nl,
	enemyHealth(B),C is B-A,retract(enemyHealth(B)),asserta(enemyHealth(C)),
	enemyHealth(J),
		(
			
			(
				J=<0,
				retract(enemyHealth(_)),asserta(enemyHealth(0)),
				show,
				write('Kamu menang dalam battle ini'),
				updateHealth(X)
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
				write('Kamu kalah dalam battle ini')
			);
			(
				show
			)
		),!. 

attack :-
	myHealth(X),enemyHealth(Y),X>0,Y>0,
	myAttack,
	enemyAttack,!.

sattack :-
	enemyHealth(Z),Z>0,useSattack(1),write('Kamu udah pakai special attack!'),!.
    
sattack :-
	enemyHealth(Z),Z>0,
	retract(useSattack(0)),asserta(useSattack(1)),
    myName(X),write(X),
    write(' uses Special Attack!'),
    write(' It dealt '),mySAttack(A),write(A),write(' damage to '),enemyName(Y),write(Y),nl,nl,
	enemyHealth(B),C is B-A,retract(enemyHealth(B)),asserta(enemyHealth(C)),
	enemyHealth(J),
	(
			
		(
			J=<0,
			retract(enemyHealth(_)),asserta(enemyHealth(0)),
			show,
			write('Kamu menang dalam battle ini')
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

modifier(X) :-
	nattack(X,Z),
	Z1 is Z*1.5,
	Z2 is Z*0.5,
	(
		myType(A), A == water, enemyType(B), B == fire,
		retract(myAttack(_)),asserta(myAttack(Z1))

	),!.

