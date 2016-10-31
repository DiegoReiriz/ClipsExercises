(defrule R1
  (tiene-pelo ?x)
  =>
  (assert (mamifero ?x)))

(defrule R2
  (da-leche ?x)
  =>
  (assert (mamifero ?x)))

(defrule R3
  (mamifero ?X)
  (tiene-pezunas ?x)
  =>
  (assert (ungulado ?x)))

(defrule R4
  (mamifero ?X)
  (rumia ?x)
  =>
  (assert (ungulado ?x)))

(defrule R5
  (ungulado ?X)
  (tiene-cuello-largo ?x)
  =>
  (assert (jirafa ?x)))

(defrule R6
  (ungulado ?X)
  (tiene-rayas-negras ?x)
  =>
  (assert (zebra ?x)))


(deffacts hechos-iniciales
  (tiene-pelo robbie)
  (tiene-pezunas robbie)
  (tiene-rayas-negras robbie))
