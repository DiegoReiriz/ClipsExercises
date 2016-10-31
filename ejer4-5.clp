(deftemplate Paciente
 (slot id (type SYMBOL))
 (slot fiebre (type SYMBOL)(allowed-symbols alta moderada baja no nil)(default nil))
 (slot sarpullido (type SYMBOL)(allowed-symbols si no nil)(default nil))
 (slot exantema (type SYMBOL)(allowed-symbols si no nil)(default nil))
 (slot garganta-irritada (type SYMBOL)(allowed-symbols si no nil)(default nil))
 (slot vacunado (type SYMBOL)(allowed-symbols si no nil)(default nil))
 (slot diagnostico (type SYMBOL))
 (slot temperatura)
)

(defrule Sarampion
 ?p <- (Paciente (id ?x)(fiebre alta)(exantema si)(vacunado no) (diagnostico nil))
 =>
 (modify ?p (diagnostico sarampion))
 (printout t "Paciente " ?x " Diagnostico: Sarampion" crlf))

(defrule Alergia
  ?p <- (Paciente (id ?x)(fiebre no|baja|moderada) (exantema si) (diagnostico nil) )
  =>
  (modify ?p (diagnostico alergia))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia2
  ?p <- (Paciente (id ?x)(vacunado si) (exantema si) (diagnostico nil) )
  =>
  (modify ?p (diagnostico alergia))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia3
  ?p <- (Paciente (id ?x)(fiebre no)(sarpullido si)(exantema no)(garganta-irritada no)(vacunado no) (diagnostico nil))
  =>
  (modify ?p (diagnostico alergia))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule GripeComun
  ?p <- (Paciente (id ?x)(fiebre alta|moderada)(garganta-irritada si) (diagnostico nil))
  =>
  (modify ?p (diagnostico gripe-comun))
  (printout t "Paciente " ?x " Diagnostico: Gripe Comun" crlf))

(defrule tratamientoSarampion
  (Paciente (id ?x)(diagnostico sarampion))
  =>
  (assert (tratamiento descanso-cama ?x))
  (assert (tratamiento tratamiento-ayuda ?x))
  (printout t "Paciente " ?x " Tratamiento: descando en cama y tratamiento de ayuda" crlf))

(defrule tratamientoAlergia
  (Paciente (id ?x)(diagnostico alergia))
  =>
  (assert (tratamiento antihistaminicos ?x))
  (printout t "Paciente " ?x " Tratamiento: antihistamínicos" crlf))

(defrule tratamientoGripe
  (Paciente (id ?x)(diagnostico gripe-comun))
  =>
  (assert (tratamiento descanso-cama ?x))
  (printout t "Paciente " ?x " Tratamiento: descanso en cama" crlf))


(defrule evaluarNoFiebre
  ?p <- (Paciente (id ?y)(temperatura ?x)(fiebre nil))
  (test (and(numberp ?x)(< ?x 36.7)))
  =>
      (modify ?p (fiebre no))
      (printout t "Paciente " ?y " Fiebre: no" crlf)
    )

(defrule evaluarFiebreBaja
  ?p <- (Paciente (id ?y)(temperatura ?x)(fiebre nil))
  (test (
    and(
      and (numberp ?x)
        (<= ?x 36.7)
        )
      (>= ?x 35.7)
      )
    )
  =>
    (modify ?p (fiebre baja))
    (printout t "Paciente " ?y " Fiebre: baja" crlf)
  )

(defrule evaluarFiebreModerada
  ?p <- (Paciente (id ?y)(temperatura ?x)(fiebre nil))
  (test (and(and(numberp ?x)(<= ?x 39))(>= ?x 37.6)))
  =>

    (modify ?p (fiebre moderada))
      (printout t "Paciente " ?y " Fiebre: moderada" crlf)
      )

(defrule evaluarFiebreElevada
  ?p <- (Paciente (id ?y)(temperatura ?x)(fiebre nil))
  (test (and (numberp ?x)(> ?x 39)))
  =>
      (modify ?p (fiebre alta))
      (printout t "Paciente " ?y " Fiebre: alta" crlf)
    )


(defrule Rinicial-Temperatura
  (initial-fact)
    ?p <- (Paciente (id ?y)(temperatura nil)(diagnostico nil))
   =>
    (printout t "Entra la temperatura del paciente " ?y " : " crlf)
    (bind ?t (read))
    (modify ?p (temperatura ?t)))

(defrule Rinicial-Exantema
  (initial-fact)
    ?p <- (Paciente (id ?y)(exantema nil)(diagnostico nil))
   =>
    (printout t "Tiene el pacicente " ?y " exantemas (si/no): " crlf)
    (bind ?t (read))
    (modify ?p (exantema ?t)))

(defrule Rinicial-vacunado
  (initial-fact)
    ?p <- (Paciente (id ?y)(vacunado nil)(diagnostico nil))
   =>
    (printout t "Está vacunado contra el sarampion el paciente " ?y " (si/no): " crlf)
    (bind ?t (read))
    (modify ?p (vacunado ?t)))

(defrule Rinicial-Garganta-Irritada
  (initial-fact)
    ?p <- (Paciente (id ?y)(garganta-irritada nil)(diagnostico nil))
   =>
    (printout t "Tiene la garganta irritada el paciente " ?y " (si/no): " crlf)
    (bind ?t (read))
    (modify ?p (garganta-irritada ?t)))

(defrule Rinicial-sarpullido
  (initial-fact)
    ?p <- (Paciente (id ?y)(sarpullido nil)(diagnostico nil))
   =>
    (printout t "Tiene un sarpullido el paciente " ?y " (si/no): " crlf)
    (bind ?t (read))
    (modify ?p (sarpullido ?t)))

(defrule Rinicial-diagnosticoNo
    ?p <- (Paciente (id ?y)(diagnostico nil))
   =>
    (printout t "No se tiene un diagnostico para el paciente " ?y crlf)
    (modify ?p (diagnostico no)))


(deffacts BHinicial
 (Paciente (id P4) (exantema si))
 (Paciente (id P5))
 (Paciente (id P3) (vacunado si)))
