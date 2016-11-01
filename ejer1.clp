
(defrule regla-tipo-robot
 (initial-fact)
=>
 (printout t "Que tipo de robot es (chofer/peaton)? ")
 (assert (tipo-robot (read)))
) 

(defrule  regla-semaforo-chofer
 (tipo-robot chofer)
=>
 (printout t "Semaforo para los coches? ")
 (assert (semaforo (read)))
) 

(defrule regla-semaforo-peaton 
 (tipo-robot peaton)
=>
 (printout t "Semaforo para los peatones? ")
 (assert (semaforo (read)))
) 

(defrule robot-puede-pasar
	(tipo-robot ?tipo)
	(semaforo verde)
=>
	(printout t "El robot " ?tipo " puede pasar" crlf)
) 

(defrule robot-debe-esperar
	(tipo-robot ?tipo)
	(semaforo rojo)
=>
	(printout t "El robot " ?tipo " debe esperar" crlf)
)


(defrule robot-con-cuidado
	(tipo-robot ?tipo)
	(semaforo ambar | intermitente)
=>
	(printout t "El robot " ?tipo " debe pasar con cuidado" crlf)
)
