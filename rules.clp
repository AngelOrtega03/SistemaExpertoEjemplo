; MENUS
; Menu principal
(defrule menu
   (declare (salience 110))
   (not (opcion))
   =>
   (printout t "---SISTEMA EXPERTO---" crlf)
   (printout t "1. Agregar" crlf)
   (printout t "2. Eliminar" crlf)
   (printout t "3. Mostrar" crlf)
   (printout t "----------------------" crlf)
   (printout t "SELECCIONE UNA OPCION :")
   (assert (opcion (opcion (read)))))

; Menu AGREGAR
(defrule agregar-menu
   ?o <- (opcion (opcion 1))
   =>
   (printout t "---AGREGAR---" crlf)
   (printout t "1. Smartphone" crlf)
   (printout t "2. Computadora" crlf)
   (printout t "3. Accesorio" crlf)
   (printout t "4. Cliente" crlf)
   (printout t "5. Orden" crlf)
   (printout t "6. Tarjeta de credito" crlf)
   (printout t "0. Volver al menu" crlf)
   (printout t "----------------------" crlf)
   (printout t "SELECCIONE UNA OPCION :")
   (retract ?o)
   (assert (opcion (opcion 1) (menu (read)))))

; Menu ELIMINAR
(defrule eliminar-menu
   ?o <- (opcion (opcion 2))
   =>
   (printout t "---ELIMINAR---" crlf)
   (printout t "1. Smartphone" crlf)
   (printout t "2. Computadora" crlf)
   (printout t "3. Accesorio" crlf)
   (printout t "4. Cliente" crlf)
   (printout t "5. Orden" crlf)
   (printout t "6. Tarjeta de credito" crlf)
   (printout t "0. Volver al menu" crlf)
   (printout t "----------------------" crlf)
   (printout t "SELECCIONE UNA OPCION :")
   (retract ?o)
   (assert (opcion (opcion 2) (menu (read)))))

; Menu MOSTRAR
(defrule mostrar-menu
   ?o <- (opcion (opcion 3))
   =>
   (facts)
   (retract ?o))

; Salir del menu
(defrule salir-menu
   ?o <- (opcion (opcion ?op) (menu 0))
   =>
   (retract ?o))

; Submenus AGREGAR
(defrule agregar-smartphone-menu
   ?o <- (opcion (opcion 1) (menu 1))
   =>
   (printout t "---AGREGAR SMARTPHONE---" crlf)
   (printout t "Ingrese la marca: " crlf)
   (bind ?marca (read))
   (printout t "Ingrese el modelo: " crlf)
   (bind ?modelo (read))
   (printout t "Ingrese el color: " crlf)
   (bind ?color (read))
   (printout t "Ingrese el precio: " crlf)
   (bind ?precio (read))
   (printout t "Ingrese la cantidad: " crlf)
   (bind ?cantidad (read))
   (bind ?nuevo-id (gensym))
   (assert (smartphone (smartphone-id ?nuevo-id) (marca ?marca) (modelo ?modelo) (precio ?precio) (cantidad ?cantidad)))
   (printout t "SMARTPHONE INGRESADO!" crlf)
   (retract ?o))

(defrule agregar-computadora-menu
   ?o <- (opcion (opcion 1) (menu 2))
   =>
   (printout t "---AGREGAR COMPUTADORA---" crlf)
   (printout t "Ingrese la marca: " crlf)
   (bind ?marca (read))
   (printout t "Ingrese el modelo: " crlf)
   (bind ?modelo (read))
   (printout t "Ingrese el color: " crlf)
   (bind ?color (read))
   (printout t "Ingrese el precio: " crlf)
   (bind ?precio (read))
   (printout t "Ingrese la cantidad: " crlf)
   (bind ?cantidad (read))
   (bind ?nuevo-id (gensym))
   (assert (computadora (computadora-id ?nuevo-id) (marca ?marca) (modelo ?modelo) (precio ?precio) (cantidad ?cantidad)))
   (printout t "COMPUTADORA INGRESADA!" crlf)
   (retract ?o))

(defrule agregar-accesorio-menu
   ?o <- (opcion (opcion 1) (menu 3))
   =>
   (printout t "---AGREGAR ACCESORIO---" crlf)
   (printout t "Ingrese el nombre: " crlf)
   (bind ?nombre (read))
   (printout t "Ingrese el precio: " crlf)
   (bind ?precio (read))
   (printout t "Ingrese la cantidad: " crlf)
   (bind ?cantidad (read))
   (bind ?nuevo-id (gensym))
   (assert (accesorio (accesorio-id ?nuevo-id) (nombre ?nombre) (precio ?precio) (cantidad ?cantidad)))
   (printout t "ACCESORIO INGRESADO!" crlf)
   (retract ?o))

(defrule agregar-cliente-menu
   ?o <- (opcion (opcion 1) (menu 4))
   =>
   (printout t "---AGREGAR CLIENTE---" crlf)
   (printout t "Ingrese el nombre: " crlf)
   (bind ?nombre (read))
   (bind ?nuevo-id (gensym))
   (assert (cliente (cliente-id ?nuevo-id) (nombre ?nombre)))
   (printout t "CLIENTE INGRESADO!" crlf)
   (retract ?o))

(defrule agregar-orden-menu
   ?o <- (opcion (opcion 1) (menu 5))
   =>
   (printout t "---AGREGAR ORDEN---" crlf)
   (printout t "Ingrese el id del cliente: " crlf)
   (bind ?clienteid (read))
   (printout t "Ingrese el tipo de pago (contado o meses): " crlf)
   (bind ?tipopago (read))
   (printout t "Ingrese el id del producto: " crlf)
   (bind ?productoid (read))
   (printout t "Ingrese el id de la tarjeta: " crlf)
   (bind ?tarjetaid (read))
   (printout t "Ingrese la cantidad a comprar: " crlf)
   (bind ?cantidad (read))
   (bind ?nuevo-id (gensym))
   (assert (orden (orden-id ?nuevo-id) (tipo-pago ?tipopago) (producto-id ?productoid) (tarjeta-id ?tarjetaid) (cantidad ?cantidad)))
   (printout t "ORDEN INGRESADA!" crlf)
   (retract ?o))

(defrule agregar-tarcred-menu
   ?o <- (opcion (opcion 1) (menu 6))
   =>
   (printout t "---AGREGAR TARJETA DE CREDITO---" crlf)
   (printout t "Ingrese el banco: " crlf)
   (bind ?banco (read))
   (printout t "Ingrese el grupo: " crlf)
   (bind ?grupo (read))
   (printout t "Ingrese la fecha de expiracion: " crlf)
   (bind ?expdate (read))
   (bind ?nuevo-id (gensym))
   (assert (tarjetacred (tarjeta-id ?nuevo-id) (banco ?banco) (grupo ?grupo) (exp-date ?expdate)))
   (printout t "TARJETA DE CREDITO INGRESADA!" crlf)
   (retract ?o))

; Submenus ELIMINAR
(defrule eliminar-smartphone-menu
   ?o <- (opcion (opcion 2) (menu 1))
   =>
   (printout t "---ELIMINAR SMARTPHONE---" crlf)
   (printout t "Ingrese el id del smartphone: " crlf)
   (bind ?smartid (read))
   (modify ?o (hecho-id-eliminar ?smartid)))

(defrule eliminar-smartphone
   ?o <- (opcion (opcion 2) (menu 1) (hecho-id-eliminar ?smartid))
   ?smart <- (smartphone (smartphone-id ?smartid))
   =>
   (retract ?smart)
   (printout t "SMARTPHONE ELIMINADO!" crlf)
   (retract ?o))

(defrule eliminar-computadora-menu
   ?o <- (opcion (opcion 2) (menu 2))
   =>
   (printout t "---ELIMINAR COMPUTADORA---" crlf)
   (printout t "Ingrese el id de la computadora: " crlf)
   (bind ?compuid (read))
   (modify ?o (hecho-id-eliminar ?compuid)))

(defrule eliminar-computadora
   ?o <- (opcion (opcion 2) (menu 2) (hecho-id-eliminar ?compuid))
   ?compu <- (computadora (computadora-id ?compuid))
   =>
   (retract ?compu)
   (printout t "COMPUTADORA ELIMINADA!" crlf)
   (retract ?o))

(defrule eliminar-accesorio-menu
   ?o <- (opcion (opcion 2) (menu 3))
   =>
   (printout t "---ELIMINAR ACCESORIO---" crlf)
   (printout t "Ingrese el id del accesorio: " crlf)
   (bind ?accesid (read))
   (modify ?o (hecho-id-eliminar ?accesid)))

(defrule eliminar-accesorio
   ?o <- (opcion (opcion 2) (menu 3) (hecho-id-eliminar ?accesid)) 
   ?acces <- (accesorio (accesorio-id ?accesid))
   =>
   (retract ?acces)
   (printout t "ACCESORIO ELIMINADO!" crlf)
   (retract ?o))

(defrule eliminar-cliente-menu
   ?o <- (opcion (opcion 2) (menu 4))
   =>
   (printout t "---ELIMINAR CLIENTE---" crlf)
   (printout t "Ingrese el id del cliente: " crlf)
   (bind ?clienteid (read))
   (modify ?o (hecho-id-eliminar ?clienteid)))

(defrule eliminar-cliente
   ?o <- (opcion (opcion 2) (menu 4) (hecho-id-eliminar ?clienteid)) 
   ?cliente <- (cliente (cliente-id ?clienteid))
   =>
   (retract ?cliente)
   (printout t "CLIENTE ELIMINADO!" crlf)
   (retract ?o))

(defrule eliminar-orden-menu
   ?o <- (opcion (opcion 2) (menu 5))
   =>
   (printout t "---ELIMINAR ORDEN---" crlf)
   (printout t "Ingrese el id de la orden: " crlf)
   (bind ?ordenid (read))
   (modify ?o (hecho-id-eliminar ?ordenid)))

(defrule eliminar-orden
   ?o <- (opcion (opcion 2) (menu 5) (hecho-id-eliminar ?ordenid)) 
   ?orden <- (orden (orden-id ?ordenid))
   =>
   (retract ?orden)
   (printout t "ORDEN ELIMINADA!" crlf)
   (retract ?o))

(defrule eliminar-tarcred-menu
   ?o <- (opcion (opcion 2) (menu 6))
   =>
   (printout t "---ELIMINAR TARJETA DE CREDITO---" crlf)
   (printout t "Ingrese el id de la tarjeta de credito: " crlf)
   (bind ?tarid (read))
   (modify ?o (hecho-id-eliminar ?tarid)))

(defrule eliminar-tarcred
   ?o <- (opcion (opcion 2) (menu 6) (hecho-id-eliminar ?tarid)) 
   ?tarcred <- (tarjetacred (tarjeta-id ?tarid))
   =>
   (retract ?tarcred)
   (printout t "TARJETA DE CREDITO ELIMINADA!" crlf)
   (retract ?o))

; Otras reglas
(defrule 24-meses
   (declare (salience 80))
   (orden (tarjeta-id ?tar-id) (producto-id ?prod-id) (orden-activa 1))
   (tarjetacred (tarjeta-id ?tar-id) (banco banamex))
   (smartphone (smartphone-id ?prod-id) (modelo iPhone16))
   =>
   (printout t "Por comprar un iPhone16 con tarjeta Banamex, te ofrecemos 24 meses sin intereses." crlf))

(defrule 12-meses
   (declare (salience 80))
   (orden (tarjeta-id ?tar-id) (producto-id ?prod-id) (orden-activa 1))
   (tarjetacred (tarjeta-id ?tar-id) (banco liverpool) (grupo visa))
   (smartphone (smartphone-id ?prod-id) (modelo Note21))
   =>
   (printout t "Por comprar un Samsung Note21 con tarjeta Liverpool VISA, te ofrecemos 12 meses sin intereses." crlf))

(defrule 100-vales
   (declare (salience 80))
   (orden (orden-id ?ordenid1) (producto-id ?smart-id) (cantidad ?cant-smart) (cliente-id ?cliente) (orden-activa 1))
   (orden (orden-id ?ordenid1) (producto-id ?compu-id) (cantidad ?cant-compu) (cliente-id ?cliente) (orden-activa 1))
   (smartphone (smartphone-id ?smart-id) (modelo iPhone16) (precio ?precio-smart))
   (computadora (computadora-id ?compu-id) (modelo macbookair) (precio ?precio-compu))
   (test (>= (+ (* ?cant-smart ?precio-smart) (* ?cant-compu ?precio-compu)) 1000))
   (test (neq ?smart-id ?compu-id))
   =>
   (bind ?total (+ (* ?cant-smart ?precio-smart) (* ?cant-compu ?precio-compu)))
   (bind ?num-vales (integer (/ ?total 1000)))
   (printout t "Cliente " ?cliente ": Por comprar un MacBookAir y un iPhone 16 al contado, obtienes " 
             (* ?num-vales 100) " pesos en vales (Monto total: " ?total ")." crlf)
   (bind ?contador 1)
   (while (<= ?contador ?num-vales)
      (assert (vale (valor 100)
                    (cliente-id ?cliente)))
      (bind ?contador (+ ?contador 1)))
   
   (printout t "Se generaron " ?num-vales " vale(s) de 100 pesos para el cliente " ?cliente "." crlf))

(defrule 15-descuento
   (declare (salience 70))
   (orden (producto-id ?prod-id) (orden-activa 1))
   (smartphone (smartphone-id ?prod-id))
   =>
   (printout t "Por comprar un smartphone, te ofrecemos una funda y mica con el 15% de descuento." crlf))

(defrule smartphone-comprado
   (declare (salience 90))
   (orden (producto-id ?prod-id) (orden-activa 1))
   (smartphone (smartphone-id ?prod-id) (marca ?marca) (modelo ?modelo))
   =>
   (printout t "Se compró un smartphone " ?marca " " ?modelo "." crlf))

(defrule computadora-comprada
   (declare (salience 90))
   (orden (producto-id ?prod-id) (orden-activa 1))
   (computadora (computadora-id ?prod-id) (marca ?marca) (modelo ?modelo))
   =>
   (printout t "Se compró una computadora " ?marca " " ?modelo "." crlf))

(defrule accesorio-comprado
   (declare (salience 90))
   (orden (producto-id ?prod-id) (orden-activa 1))
   (accesorio (accesorio-id ?prod-id) (nombre ?nombre))
   =>
   (printout t "Se compró un accesorio " ?nombre "." crlf))

(defrule clasificar-cliente-minorista-smartphone
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (smartphone (smartphone-id ?prod-id) (marca ?marca) (modelo ?modelo))
   (test (< ?cant 10))
   =>
   (printout t "Cliente Minorista en Smartphones: Compra menos de 10 " ?marca " " ?modelo "." crlf))

(defrule clasificar-cliente-minorista-computadora
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (computadora (computadora-id ?prod-id) (marca ?marca) (modelo ?modelo))
   (test (< ?cant 10))
   =>
   (printout t "Cliente Minorista en Computadoras: Compra menos de 10 " ?marca " " ?modelo "." crlf))

(defrule clasificar-cliente-minorista-accesorio
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (accesorio (accesorio-id ?prod-id) (nombre ?nombre))
   (test (< ?cant 10))
   =>
   (printout t "Cliente Minorista en Accesorios: Compra menos de 10 " ?nombre "." crlf))

(defrule clasificar-cliente-mayorista-smartphone
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (smartphone (smartphone-id ?prod-id) (marca ?marca) (modelo ?modelo))
   (test (> ?cant 10))
   =>
   (printout t "Cliente Mayorista en Smartphones: Compra más de 10 " ?marca " " ?modelo "." crlf))

(defrule clasificar-cliente-mayorista-computadora
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (computadora (computadora-id ?prod-id) (marca ?marca) (modelo ?modelo))
   (test (> ?cant 10))
   =>
   (printout t "Cliente Mayorista en Computadoras: Compra más de 10 " ?marca " " ?modelo "." crlf))

(defrule clasificar-cliente-mayorista-accesorio
   (declare (salience 60))
   (orden (cantidad ?cant) (orden-activa 1) (producto-id ?prod-id))
   (accesorio (accesorio-id ?prod-id) (nombre ?nombre))
   (test (> ?cant 10))
   =>
   (printout t "Cliente Mayorista en Accesorios: Compra más de 10 " ?nombre "." crlf))

(defrule recomendaciones-iphone16
   (declare (salience 50))
   (orden (producto-id ?prod-id) (orden-activa 1))
   (smartphone (smartphone-id ?prod-id) (modelo iPhone16))
   =>
   (printout t "Recomendamos comprar accesorios para el iPhone16: Fundas y Micas." crlf))

(defrule actualizar-stock-smartphone
   (declare (salience 40))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   ?o <- (smartphone (smartphone-id ?prod-id) (marca ?marca) (modelo ?modelo) (cantidad ?smart-cant))
   (test (>= ?smart-cant ?cant))
   =>
   (bind ?total (- ?smart-cant ?cant))
   (modify ?orden (orden-activa 0))
   (modify ?o (cantidad ?total))
   (printout t "Stock actualizado. Quedan " ?total " unidades de " ?marca " " ?modelo crlf))

(defrule actualizar-stock-computadora
   (declare (salience 40))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   ?o <- (computadora (computadora-id ?prod-id) (marca ?marca) (modelo ?modelo) (cantidad ?compu-cant))
   (test (>= ?compu-cant ?cant))
   =>
   (bind ?total (- ?compu-cant ?cant))
   (modify ?orden (orden-activa 0))
   (modify ?o (cantidad ?total))
   (printout t "Stock actualizado. Quedan " ?total " unidades de " ?marca " " ?modelo crlf))

(defrule actualizar-stock-accesorio
   (declare (salience 40))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   ?o <- (accesorio (accesorio-id ?prod-id) (nombre ?nombre) (cantidad ?acces-cant))
   (test (>= ?acces-cant ?cant))
   =>
   (bind ?total (- ?acces-cant ?cant))
   (modify ?orden (orden-activa 0))
   (modify ?o (cantidad ?total))
   (printout t "Stock actualizado. Quedan " ?total " unidades de " ?nombre crlf))

(defrule inventario-insuficiente-smartphone
   (declare (salience 100))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   (smartphone (smartphone-id ?prod-id) (modelo ?modelo) (marca ?marca) (cantidad ?smart-cant))
   (test (< ?smart-cant ?cant))
   =>
   (retract ?orden)
   (printout t "¡Advertencia! No hay suficiente inventario para el smartphone " ?marca " " ?modelo 
             " (Solicitado: " ?cant ", Disponible: " ?smart-cant ")" crlf))

(defrule inventario-insuficiente-computadora
   (declare (salience 100))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   (computadora (computadora-id ?prod-id) (modelo ?modelo) (marca ?marca) (cantidad ?compu-cant))
   (test (< ?compu-cant ?cant))
   =>
   (retract ?orden)
   (printout t "¡Advertencia! No hay suficiente inventario para la computadora " ?marca " " ?modelo 
             " (Solicitado: " ?cant ", Disponible: " ?compu-cant ")" crlf))

(defrule inventario-insuficiente-accesorio
   (declare (salience 100))
   ?orden <- (orden (producto-id ?prod-id) (cantidad ?cant) (orden-activa 1))
   (accesorio (accesorio-id ?prod-id) (nombre ?nombre) (cantidad ?acces-cant))
   (test (< ?acces-cant ?cant))
   =>
   (retract ?orden)
   (printout t "¡Advertencia! No hay suficiente inventario para el accesorio " ?nombre 
             " (Solicitado: " ?cant ", Disponible: " ?acces-cant ")" crlf))

; Regla FINAL: Marcar como procesada solo después de todas las reglas
(defrule marcar-orden-procesada
   (declare (salience -100))
   ?o <- (orden (orden-id ?id) (orden-activa 1))
   =>
   (modify ?o (orden-activa 0)))