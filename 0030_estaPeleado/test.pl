test(americaDelSur_esta_peleado) :-
	estaPeleado(americaDelSur).

test(asia_no_esta_peleado, fail) :-
	estaPeleado(asia).
	
test(estaPeleado_es_inversible,
	[true(Continente == americaDelSur), nondet]) :-
	estaPeleado(Continente).