test(magenta_destruyo_al_rojo, nondet) :-
	cumpleObjetivos(magenta).

test(blanco_ocupa_europa) :-
	cumpleObjetivos(blanco).
	
test(negro_ocupa_dos_paises_de_oceania, nondet) :-
	cumpleObjetivos(negro).
	
test(amarillo_no_cumple_todos_los_objetivos, fail) :-
	cumpleObjetivos(amarillo).
	
test(cumpleObjetivos_es_inversible,
	[set(Jugador == [magenta, blanco, negro]), nondet]) :-
	cumpleObjetivos(Jugador).
