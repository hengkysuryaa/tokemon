:- dynamic(tokenemy/1).


/* nama(Tokemon) */
nama(pikacrot). /* Tokemon Awal */
nama(slowbro).
nama(charmaster).
nama(squirtlel).
nama(togemon).
nama(elpijimon).
nama(anumon).
nama(tokedmon).
nama(duarmon).
nama(bebekmon).
nama(apimon). /* Legendary */
nama(airmon). /* Legendary */
nama(terangmon).
nama(gelapmon).
nama(chidorimon).
nama(gunturumon).
nama(ekusupuromon).
nama(megumon).

/* legend(apimon).
legend(airmon). */

jenis(apimon,legend).
jenis(airmon,legend).
jenis(pikacrot,normal).
jenis(slowbro,normal).
jenis(charmaster,normal).
jenis(squirtlel,normal).
jenis(togemon,normal).
jenis(elpijimon,normal).
jenis(anumon,normal).
jenis(tokedmon,normal).
jenis(duarmon,normal).
jenis(bebekmon,normal).
jenis(terangmon,normal).
jenis(gelapmon,normal).
jenis(chidorimon,normal).
jenis(gunturumon,normal).
jenis(ekusupuromon,normal).
jenis(megumon,normal).

/* health(Tokemon,VHealth). */
health(pikacrot,105). /* Tokemon Awal */
health(slowbro,350).
health(charmaster,160).
health(squirtlel,140).
health(togemon,250).
health(elpijimon,180).
health(anumon,175).
health(tokedmon,190).
health(duarmon,100).
health(bebekmon,160).
health(apimon,850). /* Legendary */
health(airmon,850). /* Legendary */
health(terangmon,120).
health(gelapmon,200).
health(chidorimon,170).
health(gunturumon,150).
health(ekusupuromon,70).
health(megumon,50).

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
tipe(terangmon,light).
tipe(gelapmon,light).
tipe(chidorimon,thunder).
tipe(gunturumon,thunder).
tipe(ekusupuromon,blast).
tipe(megumon,blast).

/* nattack(Tokemon,Damage). */
nattack(pikacrot,35).
nattack(slowbro,15).
nattack(charmaster,50).
nattack(squirtlel,55).
nattack(togemon,40).
nattack(elpijimon,50).
nattack(anumon,45).
nattack(tokedmon,60).
nattack(duarmon,75).
nattack(bebekmon,45).
nattack(apimon,90). /* Legendary */
nattack(airmon,90). /* Legendary */
nattack(terangmon,40).
nattack(gelapmon,25).
nattack(chidorimon,70).
nattack(gunturumon,80).
nattack(ekusupuromon,20).
nattack(megumon,10).

/* sattack(Tokemon,SuperDamage). */
sattack(pikacrot,60).
sattack(slowbro,75).
sattack(charmaster,80).
sattack(squirtlel,85).
sattack(togemon,70).
sattack(elpijimon,80).
sattack(anumon,70).
sattack(tokedmon,100).
sattack(duarmon,125).
sattack(bebekmon,80).
sattack(apimon,150). /* Legendary */
sattack(airmon,150). /* Legendary */
sattack(terangmon,75).
sattack(gelapmon,65).
sattack(chidorimon,85).
sattack(gunturumon,75).
sattack(ekusupuromon,130).
sattack(megumon,150).

initEnemy :-
	asserta(tokenemy(slowbro)),
	asserta(tokenemy(charmaster)),
/*	asserta(tokenemy(squirtlel)), */
	asserta(tokenemy(togemon)),
	asserta(tokenemy(elpijimon)),
	asserta(tokenemy(anumon)),
/*	asserta(tokenemy(tokedmon)),
	asserta(tokenemy(duarmon)),
	asserta(tokenemy(bebekmon)),
	asserta(tokenemy(apimon)), */
	asserta(tokenemy(airmon)).
/*	asserta(tokenemy(terangmon)),
	asserta(tokenemy(gelapmon)),
	asserta(tokenemy(chidorimon)),
	asserta(tokenemy(gunturumon)),
	asserta(tokenemy(ekusupuromon)),
	asserta(tokenemy(megumon)). */