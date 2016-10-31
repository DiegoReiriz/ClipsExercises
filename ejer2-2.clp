(defrule R1
  (tiene-pelo ?x)
  =>
  (assert (mamifero ?x)))

(defrule R2
  (da-leche ?x)
  =>
  (assert (mamifero ?x)))

(defrule R3
  (tiene-plumas ?x)
  =>
  (assert (ave ?x)))

(defrule R4
  (vuela-bien ?x)
  (pone-huevos ?x)
  =>
  (assert (ave ?x)))

(defrule R5
  (come-carne ?x)
  =>
  (assert (carnivoro ?x)))

(defrule R6
  (tiene-dientes-puntiagudos ?x)
  (tiene-garras ?x)
  (tiene-ojos-al-frente ?x)
  =>
  (assert (carnivoro ?x)))

(defrule R7
  (mamifero ?X)
  (tiene-pezunas ?x)
  =>
  (assert (ungulado ?x)))

(defrule R8
  (mamifero ?X)
  (rumia ?x)
  =>
  (assert (ungulado ?x)))

(defrule R9
  (mamifero ?X)
  (carnivoro ?x)
  (tiene-color-leonardo ?x)
  (tiene-manchas-oscuras ?x)
  =>
  (assert (especie leopardo ?x)))

(defrule R10
  (mamifero ?X)
  (carnivoro ?x)
  (tiene-color-leonardo ?x)
  (tiene-rayas-negras ?x)
  =>
  (assert (especie tigre ?x)))


(defrule R11
  (ungulado ?X)
  (tiene-cuello-largo ?x)
  =>
  (assert (especie jirafa ?x)))

(defrule R12
  (ungulado ?X)
  (tiene-rayas-negras ?x)
  =>
  (assert (especie zebra ?x)))

(defrule R13
  (ave ?X)
  (not (vuela-bien ?x))
  (tiene-cuello-largo ?x)
  (tiene-piernas-largas ?x)
  (blanco-negro ?x)
  =>
  (assert (especie avestruz ?x)))

(defrule R14
  (ave ?x)
  (not (vuela-bien ?x))
  (nada ?x)
  (blanco-negro ?x)
  =>
  (assert (especie pinguino ?x)))

(defrule R15
  (ave ?x)
  (vuela-bien ?x)
  =>
  (assert (especie alvatros ?x)))

(defrule R16
  (especie ?z ?x)
  (es-padre ?x ?y)
  =>
  (assert (especie ?z ?y)))

(deffacts hechos-iniciales
  (tiene-pelo robbie)
  (tiene-manchas-oscuras robbie)
  (come-carne robbie)
  (tiene-color-leonardo robbie)
  (tiene-plumas suzie)
  (vuela-bien suzie)
  (es-padre suzie pancho))
