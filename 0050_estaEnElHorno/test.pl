test(brasil_esta_en_el_horno) :-
	estaEnElHorno(brasil).

test(china_no_esta_en_el_horno, fail) :-
	estaEnElHorno(china).
	
test(estaEnElHorno_es_inversible,
	[set(Paises == [brasil, kamtchatka])]) :-
	estaEnElHorno(Paises).
