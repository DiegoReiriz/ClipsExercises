(deftemplate Paciente
 (slot id (type SYMBOL))
 (slot fiebre (type SYMBOL)(allowed-symbols alta moderada baja no)(default no))
 (slot sarpullido (type SYMBOL)(allowed-symbols si no)(default no))
 (slot exantema (type SYMBOL)(allowed-symbols si no)(default no))
 (slot garganta-irritada (type SYMBOL)(allowed-symbols si no)(default no))
 (slot vacunado-sarampion (type SYMBOL)(allowed-symbols si no)(default no))
)

(defrule Sarampion
 (Paciente (id ?x)(fiebre alta)(exantema si)(vacunado-sarampion no))
 =>
 (assert (diagnostico sarampion ?x))
 (printout t "Paciente " ?x " Diagnostico: Sarampion" crlf))

(defrule Alergia
  (Paciente (id ?x)(fiebre ~alta) (exantema si) )
  =>
  (assert (diagnostico alergia ?x))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia2
  (Paciente (id ?x)(vacunado-sarampion si) (exantema si) )
  =>
  (assert (diagnostico alergia ?x))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule Alergia3
  (Paciente (id ?x)(fiebre no)(sarpullido si)(exantema no)(garganta-irritada no)(vacunado-sarampion no))
  =>
  (assert (diagnostico alergia ?x))
  (printout t "Paciente " ?x " Diagnostico: Alergia" crlf))

(defrule GripeComun
  (Paciente (id ?x)(fiebre alta|moderada)(garganta-irritada si))
  =>
  (assert (diagnostico gripe-comun ?x))
  (printout t "Paciente " ?x " Diagnostico: Gripe Comun" crlf))

(defrule tratamientoSarampion
  (diagnostico sarampion ?x)
  =>
  (assert (tratamiento descanso-cama ?x))
  (assert (tratamiento tratamiento-ayuda ?x))
  (printout t "Paciente " ?x " Tratamiento: Descanso en cama y tratamiento de ayuda" crlf))


(defrule tratamientoAlergia
  (diagnostico alergia ?x)
  =>
  (assert (tratamiento antihistaminicos ?x))
  (printout t "Paciente " ?x " Tratamiento: antihistamínicos" crlf))


(defrule tratamientoGripe
  (diagnostico gripe-comun ?x)
  =>
  (assert (tratamiento descanso-cama ?x))
  (printout t "Paciente " ?x " Tratamiento: descanso en cama" crlf))

(deffacts BHinicial
 (Paciente (fiebre alta) (exantema si) (id P2))
 (Paciente (fiebre moderada) (garganta-irritada si) (id P3))
 (Paciente (fiebre baja) (sarpullido si) (id P4)))
