(defrule R1
  (A)
  =>
  (assert (C)))

(defrule R2
  (A)
  =>
  (assert (B)))

(defrule R3
  (H)
  =>
  (assert (I)))

(defrule R4
  (H)
  =>
  (assert (J)))

(deffacts hechos-iniciales
  (A)
  (H))
