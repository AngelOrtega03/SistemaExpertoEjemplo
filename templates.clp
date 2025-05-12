(deftemplate opcion
   (slot opcion)
   (slot menu)
   (slot hecho-id-eliminar))

(deftemplate smartphone
   (slot smartphone-id (default gensym*))
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot cantidad))

(deftemplate computadora
   (slot computadora-id (default gensym*))
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot cantidad))

(deftemplate accesorio
   (slot accesorio-id (default gensym*))
   (slot nombre)
   (slot precio)
   (slot cantidad))

(deftemplate cliente
   (slot cliente-id (default gensym*))
   (slot nombre))

(deftemplate orden
   (slot orden-id (default gensym*))
   (slot cliente-id)
   (slot tipo-pago)
   (slot producto-id)
   (slot tarjeta-id)
   (slot cantidad)
   (slot orden-activa (default 1)))

(deftemplate tarjetacred
   (slot tarjeta-id (default gensym*))
   (slot banco)
   (slot grupo)
   (slot exp-date))

(deftemplate vale
   (slot vale-id (default gensym*))
   (slot valor)
   (slot cliente-id))