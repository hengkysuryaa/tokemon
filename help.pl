help:-
	\+startGame(_),
	write('Belom distart pak'),nl,!.
	
help:-
	tab(4),write('Command-command yang ada:'),nl,
	tab(8),write('start.            :- Mulai permainan bro!'),nl,
	tab(8),write('help.             :- Liat command-command yang ada'),nl,
	tab(8),write('quit.             :- Keluar dari permainan'),nl,
	tab(8),write('w. a. s. d.       :- Gerak-gerak'),nl,
	tab(8),write('map.              :- Liat peta'),nl,
	tab(8),write('heal.             :- Nyembuhin tokemon pemain kalo ada di gym'),nl,
	tab(8),write('status.           :- Status pemain'),nl,
	tab(8),write('save(Filename).   :- Yaa ngesave permainan'),nl,
	tab(8),write('load(Filename).   :- Load permainan yang ada'),nl,nl,
	tab(4),write('Keterangan:'),nl,
	tab(8),write('X = Tembok'),nl,
	tab(8),write('P = Pemain'),nl,
	tab(8),write('G = Gym'),nl.