test(magenta_se_atrinchero, nondet) :-
	seAtrinchero(magenta).

test(amarillo_no_se_atrinchero, fail) :-
	seAtrinchero(amarillo).
	
test(seAtrinchero_es_inversible,
	[true(Jugador == magenta), nondet]) :-
	seAtrinchero(Jugador).
