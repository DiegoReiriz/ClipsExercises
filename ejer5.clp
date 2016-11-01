(deftemplate estado
 (slot jarra6)
 (slot jarra8)
 (slot padre)
 (slot nodo)
 (slot nivel)
 (slot s-accion)
 )

 (defrule Rinicial
   (initial-fact)
    =>
     (assert (estado (jarra6 0)(jarra8 0)(nodo 1)(nivel 0)(padre sin-padre)(s-accion "Inicio")))
     (assert (ciclo 1))
 )

 (defrule llenarJarra6
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 6) (jarra8 ?z)))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (< ?x 6))
   =>
       (assert (estado (jarra6 6)(jarra8 ?z)(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Llenar J6")))
       (printout t "Llenada la jarra6" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule llenarJarra8
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 ?x) (jarra8 8)))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (< ?x 8))
   =>
       (assert (estado (jarra6 ?x)(jarra8 8)(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Llenar J8")))
       (printout t "Llenada la jarra8" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule llenarJarra6ParteJarra8
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 6) (jarra8 = (- ?z (- 6 ?x)))))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (< ?x 6))
   (test (> ?z 0))
   (test (> (+ ?x ?z) 6))
   =>
       (assert (estado (jarra6 6)(jarra8 (- ?z (- 6 ?x)))(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Llenar J6 parte J8")))
       (printout t "Llenado j6 con parte j8" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule llenarJarra8ParteJarra6
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra8 8) (jarra6 = (- ?x (- 8 ?z)))))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (> ?x 0))
   (test (< ?z 8))
   (test (> (+ ?x ?z) 8))
   =>
       (assert (estado (jarra8 8)(jarra6 (- ?x (- 8 ?z)))(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Llenar J8 parte J6")))
       (printout t "Llenada jarra8 con parte j6" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule vaciarJarra6
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 0)(jarra8 ?z)))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (> ?x 0))
   =>
       (assert (estado (jarra6 0)(jarra8 ?z)(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Vaciar J6")))
       (printout t "Vaciado J6" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule vaciarJarra8
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 ?x)(jarra8 0)))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (> ?z 0))
   =>
       (assert (estado (jarra6 ?x)(jarra8 0)(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Vaciar J8")))
       (printout t "Vaciado J8" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule verterJarra6enJarra8
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 0)(jarra8 =(+ ?x ?z))))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (> ?x 0))
   (test (<= (+ ?x ?z) 8))
   =>
       (assert (estado (jarra6 0)(jarra8 (+ ?x ?z))(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Verter J6 en J8")))
       (printout t "Verter J6 en J8" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule verterJarra8enJarra6
   ?s <- (estado (jarra6 ?x)(jarra8 ?z)(nodo ?n)(nivel ?m))
   (not (estado (jarra6 =(+ ?x ?z))(jarra8 0)))
   (not (estado (jarra6 0)(jarra8 4)))
   ?c <- (ciclo ?y)
   (test (> ?x 0))
   (test (<= (+ ?x ?z) 6))
   =>
       (assert (estado (jarra6 (+ ?x ?z))(jarra8 0)(padre ?s)(nodo (+ ?y 1))(nivel (+ ?m 1))(s-accion "Verter J8 en J6")))
       (printout t "Verter J8 en J6" crlf)
       (retract ?c)
       (assert (ciclo (+ ?y 1)))
       (printout t "Ciclo " (+ ?y 1) crlf)
 )

 (defrule meta-alcanzada
	?meta <- (estado (jarra6 0) (jarra8 4))
 =>
	(printout t "Meta alcanzada: " crlf)
	(assert (obtener-padre ?meta))
	 (assert (camino))
 )

 (defrule construye-camino
	?e <- (estado (padre ?padre)(s-accion ?accion))
	?r <- (obtener-padre ?e)
	?c <- (camino $?caminoactual)
 =>
	(assert(camino ?accion ?caminoactual))
	(assert (obtener-padre ?padre))
	(retract ?c)
	(retract ?r)
 )

 (defrule terminado
	?rec <- (obtener-padre sin-padre)
	?lista <- (camino $?caminocompleto)
 =>
	(printout t "Solucion:" ?caminocompleto crlf)
	(retract ?rec ?lista)
 )
