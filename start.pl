:-include('map.pl').
:-include('help.pl').
:-include('move.pl').
:-include('utility.pl').
:-include('battle.pl').

start :-
	startGame(_),
	write('Kau udah start bosque !'),nl,!.

start :-
	randomize,			                  
	(tab(4),write('                  _.-/,->|       ____         ,-       ___    ___     __         '),nl,
	tab(4),write('              _,--      _|      |    |  /`.     --    |   |  /   |   |    |  |-.  '),nl,
	tab(4),write('          /-/        ,_-        --.  | /   `.         |    ||    |   --.   | |  | '),nl,
	tab(4),write('         |   _,_.    |        __  |  |/    ,-,-_  `.  |          | __  |    ||  | '),nl,
	tab(4),write('          |_-    |    |    /,- _`.|      ,- / / / /   |          ,- _`.|     |  | '),nl,
	tab(4),write('                  |    |,--/  | | |    ,-   | |_| / ,`|         /  | | |  |     | '),nl,
	tab(4),write('                   |    | |   |_|  |   `-.  |    `-  /|  |    ||   |_|  | ||    | '),nl,
	tab(4),write('                    |    | |      /       `-.`.___,-- |  ||  /| |      /  | |   | '),nl,
	tab(4),write('                     |    | `.__,-|  |`-._    `|      |__| || |  `.__,/|  | |   | '),nl,
	tab(4),write('                      |_.--       |__|    `-._ |               -.|      -.| |   | '),nl,
	tab(4),write('                                              `                             --._| '),nl,


	write('                                       `;-.          ___,      '),nl,
	write('                                         `.`\\_...._/`.-"`          '),nl,
	write('                                           \\        /      ,       '),nl,
	write('                                           /()   () \\    .'' `-._   '),nl,
	write('                                          |)  .    ()\\  /   _.''    '),nl,
	write('                                          \\  -''-     ,; ''. <       '),nl,
	write('                                           ;.__     ,;|   > \\      '),nl,
	write('                                          / ,    / ,  |.-''.-''      '),nl,
	write('                                         (_/    (_/ ,;|.<`         '),nl,
	write('                                           \\    ,     ;-`          '),nl,
	write('                                            >   \\    /             '),nl,
	write('                                           (_,-''`> .''              '),nl,
	write('                                                (_,''               '),nl,
	write(''),nl,
	write(''),nl,
	write(''),nl,
	
	tab(4),write('HALO POKEMON TRAINER!'),nl,
	tab(4),write('SENANG BERTEMU DENGAN ANDA'),nl,
	tab(4),write('SELAMAT DATANG DI DUNIA MAYA!'),nl,
	tab(4),write('DI DUNIA MAYA INI KAMU AKAN BERTEMU DENGAN BANYAK TOKEMON!'),nl,
	tab(4),write('UNTUK BEBERAPA ORANG, TOKEMON ADALAH PELIHARAAN MEREKA, NAMUN POKEMON TRAINER SEPERTI KAMULAH YANG DIBUTUHKAN UNTUK MENYELAMATKAN DUNIA!'),nl,
	tab(4),write('BANTULAH KAMI UNTUK MENGALAHKAN AIRMON DAN APIMON'),nl,
	tab(4),write('MEREKA ADALAH TOKEMON JAHAT YANG AKAN MENGHANCURKAN DUNIA MAYA'),nl,
	tab(4),write('HANYA KAMULAH SATU - SATUNYA POKEMON TRAINER YANG DAPAT MENYELAMATKAN DUNIA INI!'),nl,
	tab(4),write('KAMI BUTUH BANTUANMU!'),nl,
	tab(4),write('NAMUN, AKU TAU KAMU JUGA MEMBUTUHKAN KU UNTUK BERKELANA DI DUNIA MAYA INI'),nl,
	tab(4),write('AKU, PROFESOR RICHARD AKAN MEMBERI SATU BEKAL!'),nl,
	tab(4),write('GUNAKAN INI SEBAIK MUNGKIN!'),nl,
	tab(4),write(''),nl,
	tab(4),write(''),nl,
	help,
	tab(4),write(''),nl,
	tab(4),write(''),nl,
	tab(4),write('SELAMAT MEMULAI PETUALANGANMU DI DUNIA MAYA!'),nl,
	tab(4),write('POKEMON TRAINER MENDAPATKAN --PIKACROT--'),nl,
	tab(4),write(''),nl,
	tab(4),write(''),nl),
	awal,!.

statusToke :- 
	findall(X,inventori(X,_),List1),
	write('Tokemonmu: '),nl,
	printStatusN(List1),!.

statusMusuh :- 
	findall(A,musuh(A,_,_,_,legend),List2),
	write('Musuhmu: '),nl,
	printStatusL(List2).

status :-
	\+startGame(_),
	write('start dulu bosque'),nl,!.

status :-
	statusToke,
	statusMusuh,!.

/* dipake setelah menang battle */
capture :- 
	invCount(6),write('Inventorimu penuh! drop/0 untuk melepas tokemonmu'),nl,!.
capture :- 
	enemyName(X),
	retractCap(X),
	health(X,H),asserta(inventori(X,H)),
	countInvCap(X),!.
	
/*	retract(tokemon(X,_,_,_)),!. */

retractCap(X) :-
	(	
		musuh(X,_,_,_,_),
		retract(musuh(X,_,_,_,_))
	),!.

/* dipake setelah kalah battle atau pengen buang tokemon */
drop(X) :-
	retract(inventori(X,_)),
	countInvDrop(X),
	assertDrop(X),!.
/*	assertz(tokemon(X,_,_,_)),!. */

assertDrop(X) :-

	(	
		jenis(X,A),
		health(X,H2),
		assertz(musuh(X,H2,_,_,A))
	),!.

/* asusmsi di gym harus pake heal */
heal :-
	isGym(0),write('Kamu tidak berada di gym!'),nl,!.
heal :-
	isGym(-1),write('Kamu sudah pernah memakai heal!'),nl,!.
heal :- /* syarat bisa dipake saat di gym */
	isGym(1),
	forall(inventori(Tokemon,_),
	(
		retract(inventori(Tokemon,_)),
		health(Tokemon,H),asserta(inventori(Tokemon,H))

	)),write('Tokemon di inventorimu berhasil di sembuhkan!'),nl,
	retract(isGym(1)),asserta(isGym(-1)),!.

