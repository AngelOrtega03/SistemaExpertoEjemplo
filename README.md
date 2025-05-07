# Como correrlo en CLIPS

## Para cargar los hechos
CLIPS > (batch* "run.clp")

## Para ver los hechos cargados
CLIPS > (facts)

## Para ingresar una orden (Ejemplo)
CLIPS > (assert (orden (producto-id sm1) (tarjeta-id tar1) (cliente-id 1) (cantidad 2)))

## Para correr los resultados
CLIPS > (run)
