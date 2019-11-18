/* DEKLARASI FAKTA DASAR TOKEMON GAME */

:- dynamic(tokemon/5). /* tokemon(Player,Tipe,Health,X,Y) ini masih merawang tinggi*/ 

modifier(fire,X) :- nattack(_,A),X is A*1.5.
modifier(fire,X) :- sattack(_,A),X is A*1.5.

modifier(Nama,X) :- tipe(Nama,T),nattack(Nama,A),X is A*1.5.

/* health(Tokemon,VHealth). */
health(pikacrot, 105). /* Tokemon Awal */
health(slowbro, 350).
health(charmaster, 160).
health(squirtlel, 140).
health(togemon, 250).
health(elpijimon, 180).
health(anumon, 175).
health(tokedmon, 190).
health(duarmon, 100).
health(bebekmon, 160).
health(apimon, 850). /* Legendary */
health(airmon, 850). /* Legendary */

/* tipe(Tokemon,VType). */
tipe(charmaster,fire).
tipe(elpijimon,fire).
tipe(duarmon,fire).
tipe(pikacrot,water).
tipe(squirtlel,water).
tipe(anumon,water).
tipe(bebekmon,water).
tipe(togemon,leaves).
tipe(slowbro,leaves).
tipe(tokedmon,leaves).
tipe(apimon,fire). /* Legendary */
tipe(airmon,water). /* Legendary */

/* nattack(Tokemon,Damage). */
nattack(pikacrot, 35).
nattack(slowbro, 15).
nattack(charmaster, 50).
nattack(squirtlel, 55).
nattack(togemon, 40).
nattack(elpijimon, 50).
nattack(anumon, 45).
nattack(tokedmon, 60).
nattack(duarmon, 75).
nattack(bebekmon, 45).
nattack(apimon, 90). /* Legendary */
nattack(airmon, 90). /* Legendary */

/* sattack(Tokemon,SuperDamage). */
sattack(pikacrot, 60).
sattack(slowbro, 75).
sattack(charmaster, 80).
sattack(squirtlel, 85).
sattack(togemon, 70).
sattack(elpijimon, 80).
sattack(anumon, 70).
sattack(tokedmon, 100).
sattack(duarmon, 125).
sattack(bebekmon, 80).
sattack(apimon, 150). /* Legendary */
sattack(airmon, 150). /* Legendary */