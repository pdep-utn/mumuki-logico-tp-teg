test(amarillo_ocupa_americaDelNorte) :-
	ocupaContinente(amarillo, americaDelNorte).

test(magenta_no_ocupa_ningun_continente, fail) :-
	ocupaContinente(magenta, _).

test(ocupa_continente_es_inversible_respecto_al_jugador,
	[true(Jugador == amarillo), nondet]) :-
	ocupaContinente(Jugador, americaDelNorte).
	
test(ocupa_continente_es_inversible_respecto_al_continente,
	[true(Continente == americaDelNorte), nondet]) :-
	ocupaContinente(amarillo, Continente).
