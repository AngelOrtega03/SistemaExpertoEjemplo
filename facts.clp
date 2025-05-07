(assert (smartphone (smartphone-id sm1) (marca apple) (modelo iPhone16) (color rojo) (precio 27000) (cantidad 20)))
(assert (smartphone (smartphone-id sm2) (marca samsung) (modelo Note21) (color negro) (precio 24000) (cantidad 20)))
(assert (smartphone (smartphone-id sm3) (marca xiaomi) (modelo RedmiNote10) (color azul) (precio 12000) (cantidad 20)))

(assert (computadora (computadora-id pc1) (marca apple) (modelo macbookpro) (color gris) (precio 47000) (cantidad 20)))
(assert (computadora (computadora-id pc2) (marca lenovo) (modelo ideapad) (color negro) (precio 22000) (cantidad 20)))
(assert (computadora (computadora-id pc3) (marca apple) (modelo macbookair) (color blanco) (precio 30000) (cantidad 20)))

(assert (accesorio (accesorio-id acc1) (nombre funda) (precio 500) (cantidad 20)))
(assert (accesorio (accesorio-id acc2) (nombre mica) (precio 300) (cantidad 20)))
(assert (accesorio (accesorio-id acc3) (nombre funda) (precio 400) (cantidad 20)))

(assert (cliente (cliente-id 1) (nombre Juan)))
(assert (cliente (cliente-id 2) (nombre Maria)))
(assert (cliente (cliente-id 3) (nombre Pedro)))

(assert (tarjetacred (tarjeta-id tar1) (banco banamex) (grupo visa) (exp-date 12-12-23)))
(assert (tarjetacred (tarjeta-id tar2) (banco bbva) (grupo mastercard) (exp-date 11-11-23)))
(assert (tarjetacred (tarjeta-id tar3) (banco liverpool) (grupo visa) (exp-date 05-05-24)))

(assert (vale (valor 100) (cliente-id 1)))
(assert (vale (valor 50) (cliente-id 2)))


