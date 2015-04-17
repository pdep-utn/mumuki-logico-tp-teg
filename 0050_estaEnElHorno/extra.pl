continente(americaDelSur).
continente(americaDelNorte).
continente(asia).
continente(oceania).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(asia, kamtchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(oceania,australia).
estaEn(oceania,sumatra).
estaEn(oceania,java).
estaEn(oceania,borneo).

jugador(amarillo).
jugador(magenta).
jugador(negro).

ocupa(argentina, magenta).
ocupa(chile, negro).
ocupa(brasil, amarillo).
ocupa(uruguay, magenta).
ocupa(alaska, amarillo).
ocupa(yukon, amarillo).
ocupa(canada, amarillo).
ocupa(oregon, amarillo).
ocupa(kamtchatka, negro).
ocupa(china, amarillo).
ocupa(siberia, amarillo).
ocupa(japon, amarillo).
ocupa(australia, negro).
ocupa(sumatra, negro).
ocupa(java, negro).
ocupa(borneo, negro).

% Usar este para saber si son limitrofes ya que es una relacion simetrica
sonLimitrofes(X, Y) :- limitrofes(X, Y).
sonLimitrofes(X, Y) :- limitrofes(Y, X).

limitrofes(argentina,brasil).
limitrofes(argentina,chile).
limitrofes(argentina,uruguay).
limitrofes(uruguay,brasil).
limitrofes(alaska,kamtchatka).
limitrofes(alaska,yukon).
limitrofes(canada,yukon).
limitrofes(alaska,oregon).
limitrofes(canada,oregon).
limitrofes(siberia,kamtchatka).
limitrofes(siberia,china).
limitrofes(china,kamtchatka).
limitrofes(japon,china).
limitrofes(japon,kamtchatka).
limitrofes(australia,sumatra).
limitrofes(australia,java).
limitrofes(australia,borneo).
limitrofes(australia,chile).

objetivo(amarillo, ocuparContinente(asia)).
objetivo(amarillo,ocuparPaises(2, americaDelSur)). 
objetivo(rojo, destruirJugador(negro)). 
objetivo(magenta, destruirJugador(rojo)). 
objetivo(negro, ocuparContinente(oceania)).
objetivo(negro,ocuparContinente(americaDelSur)). 

cuantosPaisesOcupaEn(amarillo, americaDelSur, 1).
cuantosPaisesOcupaEn(amarillo, americaDelNorte, 4).
cuantosPaisesOcupaEn(amarillo, asia, 3).
cuantosPaisesOcupaEn(amarillo, oceania, 0).
cuantosPaisesOcupaEn(magenta, americaDelSur, 2).
cuantosPaisesOcupaEn(magenta, americaDelNorte, 0).
cuantosPaisesOcupaEn(magenta, asia, 0).
cuantosPaisesOcupaEn(magenta, oceania, 0).
cuantosPaisesOcupaEn(negro, americaDelSur, 1).
cuantosPaisesOcupaEn(negro, americaDelNorte, 0).
cuantosPaisesOcupaEn(negro, asia, 1).
cuantosPaisesOcupaEn(negro, oceania, 4).

ocupaContinente(Jugador, Continente) :-
	jugador(Jugador),
	continente(Continente),
	forall(estaEn(Continente, Pais), ocupa(Pais, Jugador)).

cumpleObjetivos(Jugador) :-
	jugador(Jugador),
	forall(objetivo(Jugador, Objetivo), cumple(Jugador, Objetivo)).
	
cumple(Jugador, ocuparContinente(Continente)) :-
	ocupaContinente(Jugador, Continente).
	
cumple(Jugador, ocuparPaises(Cant, Continente)) :-
	cuantosPaisesOcupaEn(Jugador, Continente, CantOcupada),
	CantOcupada >= Cant.
	
cumple(_, destruirJugador(Enemigo)) :-
	not(ocupa(_, Enemigo)).
	
estaPeleado(Continente) :-
	continente(Continente),
	forall(jugador(Jugador), ocupaAlgunPaisEn(Jugador, Continente)).
	
ocupaAlgunPaisEn(Jugador, Continente) :-
	ocupa(Pais, Jugador),
	estaEn(Continente, Pais).
	
seAtrinchero(Jugador) :-
	ocupaAlgunPaisEn(Jugador, Continente),
	not(ocupaAlgunPaisEnOtro(Jugador, Continente)).
	
ocupaAlgunPaisEnOtro(Jugador, Continente) :-
	continente(OtroContinente),
	OtroContinente \= Continente,
	ocupaAlgunPaisEn(Jugador, OtroContinente).
