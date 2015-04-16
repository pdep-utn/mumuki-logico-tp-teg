`cumpleObjetivos/1`: Se cumple para un jugador si cumple todos los objetivos que tiene. Los objetivos se cumplen de la siguiente forma:
- ocuparContinente: el jugador debe ocupar el continente indicado
- ocuparPaises: el jugador debe ocupar al menos n países de ese continente
- destruirJugador: se cumple si el jugador indicado ya no ocupa ningún país

```
?- cumpleObjetivos(UnJugador)
UnJugador = magenta.
```

