:- include('tokemon.pl').

addTokemon(Nama) :-
	nama(Nama),
	health(Nama,Health),
	tipe(Nama,Tipe),
	nattack(Nama,Nattack),
	sattack(Nama,Sattack),
	asserta(tokemon(Nama,Health,Tipe,Nattack,Sattack)).
		
status :- 
		write('Your Tokemon: '),nl,
		addTokemon(pikacrot),
		nama(Nama),write(Nama),nl,
		write('Health: '),health(Nama,Health),write(Health),nl,
		write('Tipe: '),tipe(Nama,Tipe),write(Tipe),nl,nl,
		
		write('Your Enemy: '),nl,
		Nama == apimon,
		nama(Nama),write(Nama),nl, /* Keluarnya pikacrot */
		write('Health: '),health(Nama,Health),write(Health),nl,
		write('Tipe: '),tipe(Nama,Tipe),write(Tipe),nl,nl,
		

		Nama == airmon,
		nama(Nama),write(Nama),nl, /* Keluarnya pikacrot */
		write('Health: '),health(Nama,Health),write(Health),nl,
		write('Tipe: '),tipe(Nama,Tipe),write(Tipe),nl.
