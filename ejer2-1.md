#codigo

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

#ciclos

|Numero de ciclo|base de hechos|Agenda|
|---------------|--------------|------|
|0|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-pezunas robbie)<br/>f-3   (tiene-rayas-negras robbie)|0      R1: f-1|
|1|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-pezunas robbie)<br/>f-3   (tiene-rayas-negras robbie)<br/>f-4     (mamifero robbie)|0      R3: f-4,f-2|
|2|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-pezunas robbie)<br/>f-3   (tiene-rayas-negras robbie)<br/>f-4     (mamifero robbie)<br/>f-5     (ungulado robbie)|0      R6: f-5,f-3|
|3|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-pezunas robbie)<br/>f-3   (tiene-rayas-negras robbie)<br/>f-4     (mamifero robbie)<br/>f-5     (ungulado robbie)<br/>f-6     (zebra robbie)|  empty|
