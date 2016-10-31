(deftemplate Paciente
 (slot id (type SYMBOL))
 (slot fiebre (type SYMBOL)(allowed-symbols alta moderada baja no nil)(default nil))
 (slot sarpullido (type SYMBOL)(allowed-symbols si no)(default nil))
 (slot exantema (type SYMBOL)(allowed-symbols si no)(default nil))
 (slot garganta-irritada (type SYMBOL)(allowed-symbols si no)(default nil))
 (slot vacunado-sarampion (type SYMBOL)(allowed-symbols si no)(default nil))
 (slot diagnostico (type SYMBOL))
 (slot temperatura)
)

(defrule Rinicial
  (initial-fact)
    ?p <- (Paciente (temperatura nil))
   =>
    (printout t "Entra la temperatura del paciente: ")
    (bind ?t (read))
    (modify ?p (temperatura ?t)))


(defrule Sarampion
 ?p <- (Paciente (id ?x)(fiebre alta)(exantema si)(vacunado-sarampion no) (diagnostico nil))
 =>
 (modify ?p (diagnostico sarampion))
 (printout t "Paciente " ?x " Diagnostico: Sarampion" crlf))

(defrule Alergia
  ?p <- (Paciente (id ?x)(fiebre ~alta) (exantema si) (diagnostico nil) )
  =>
  (modify ?p (diagnostico alergia))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia2
  ?p <- (Paciente (id ?x)(vacunado-sarampion si) (exantema si) (diagnostico nil) )
  =>
  (modify ?p (diagnostico alergia))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia3
  ?p <- (Paciente (id ?x)(fiebre no)(sarpullido si)(exantema no)(garganta-irritada no)(vacunado-sarampion no) (diagnostico nil))
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

(deffacts BHinicial (Paciente (id P1)(exantema si)))
