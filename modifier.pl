modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == water, enemyType(B), B == fire,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == fire, enemyType(B), B == leaves,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == leaves, enemyType(B), B == water,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == light, enemyType(B), B == thunder,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == blast, enemyType(B), B == light,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == thunder, enemyType(B), B == blast,
		Z1 is Z*1.5,Z2 is W*0.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == fire, enemyType(B), B == water,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == water, enemyType(B), B == leaves,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == leaves, enemyType(B), B == fire,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == thunder, enemyType(B), B == light,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == light, enemyType(B), B == blast,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifier(X,Y) :-
	nattack(X,Z), /* X itu myName , Y itu enemyName */
	nattack(Y,W),
	
	(
		myType(A), A == blast, enemyType(B), B == thunder,
		Z1 is Z*0.5,Z2 is W*1.5,
		retract(myAttack(_)),asserta(myAttack(Z1)),
		retract(enemyAttack(_)),asserta(enemyAttack(Z2))

	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == water, enemyType(B), B == fire,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == fire, enemyType(B), B == leaves,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == leaves, enemyType(B), B == water,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == light, enemyType(B), B == thunder,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == blast, enemyType(B), B == light,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == thunder, enemyType(B), B == blast,
		Z1 is Z*1.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == fire, enemyType(B), B == water,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == water, enemyType(B), B == leaves,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == leaves, enemyType(B), B == fire,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == thunder, enemyType(B), B == light,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == light, enemyType(B), B == blast,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.

modifierS(X) :-
	sattack(X,Z), /* X itu myName */
	(
		myType(A), A == blast, enemyType(B), B == thunder,
		Z1 is Z*0.5,
		retract(mySAttack(_)),asserta(mySAttack(Z1))
	),!.
