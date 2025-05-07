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