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

#ciclos

|Numero de ciclo|base de hechos|Agenda|
|---------------|--------------|------|
|0|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)|0      R3: f-5<br/>0      R5: f-3<br/>0      R1: f-1|
|1|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)|0      R15: f-8,f-6<br/>0      R5: f-3<br/>0      R1: f-1|
|2|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)<br/>f-9     (especie alvatros suzie)|0      R16: f-9,f-7<br/>0      R5: f-3<br/>0      R1: f-1|
|3|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)<br/>f-9     (especie alvatros suzie)<br/>f-10    (especie alvatros pancho)|0      R5: f-3<br/>0      R1: f-1|
|4|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)<br/>f-9     (especie alvatros suzie)<br/>f-10    (especie alvatros pancho)<br/>f-11    (carnivoro robbie)|0      R1: f-1<br/>|
|5|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)<br/>f-9     (especie alvatros suzie)<br/>f-10    (especie alvatros pancho)<br/>f-11    (carnivoro robbie)<br/>f-12    (mamifero robbie)|0      R9: f-12,f-11,f-4,f-2|
|6|f-0     (initial-fact)<br/>f-1     (tiene-pelo robbie)<br/>f-2     (tiene-manchas-oscuras robbie)<br/>f-3     (come-carne robbie)<br/>f-4     (tiene-color-leonardo robbie)<br/>f-5     (tiene-plumas suzie)<br/>f-6     (vuela-bien suzie)<br/>f-7     (es-padre suzie pancho)<br/>f-8     (ave suzie)<br/>f-9     (especie alvatros suzie)<br/>f-10    (especie alvatros pancho)<br/>f-11    (carnivoro robbie)<br/>f-12    (mamifero robbie)<br/>f-13    (especie leopardo robbie)|empty|
