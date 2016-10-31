## 1 ¿Qué infiere el sistema para los siguientes pacientes?

	(deffacts BHinicial
	 (Paciente (fiebre baja) (exantema si) (id P1))
	 (Paciente (fiebre alta) (exantema si) (id P2))
	 (Paciente (fiebre moderada) (garganta-irritada si) (id P3))
	 (Paciente (fiebre baja) (sarpullido si) (id P4)))

Paciente P3 Diagnostico: Gripe Comun

Paciente P2 Diagnostico: Sarampion

Paciente P1 Diagnostico: Alergia


## 2  ¿Qué infiere el sistema para los siguientes pacientes?

	(deffacts BHinicial
	 (Paciente (temperatura 36.5) (exantema si) (id P1))
	 (Paciente (temperatura 39.5) (exantema si) (id P2))
	 (Paciente (temperatura 38) (garganta-irritada si) (id P3))
	 (Paciente (temperatura 37.3) (sarpullido si) (id P4)))

Paciente 38 Fiebre: moderada

Paciente P3 Diagnostico: Gripe Comun

Paciente P3 Tratamiento: descanso en cama

Paciente P2 Diagnostico: Alergia

Paciente P2 Tratamiento: antihistamínicos

Paciente 39.5 Fiebre: alta

Paciente P2 Tratamiento: antihistamínicos

Paciente P1 Diagnostico: Alergia

Paciente P1 Tratamiento: antihistamínicos

Paciente 36.5 Fiebre: no

Paciente P1 Tratamiento: antihistamínicos


## 3 ¿Qué sucede cuando ejecutamos (reset)? ¿De qué regla(s) habla CLIPS? ¿Qué valor tiene la temperatura del paciente inicialmente? ¿Qué condición puede estar fallando?

### 3.1

Que se cargan todas las reglas y la regla RInicial que a acabamos de introducir se carga como primera regla

### 3.2

Las reglas definidas en el archivo

### 3.3

La que le introduzca por teclado

### 3.4

¿Que no se comprueba el tipo del valor introducido por teclado en las reglas que lo usan?

Entra la temperatura del paciente: 38

Paciente P1 Diagnostico: Alergia

Paciente P1 Tratamiento: antihistamínicos

Paciente P1 Fiebre: moderada

Paciente P1 Tratamiento: antihistamínicos

#4  ¿En qué reglas debe añadirse? ¿En qué lugar del antecedente, como primera, segunda o tercera condición? ¿Qué sucede cuando ejecutamos (reset)?

### 4.1

En las que usen el valor de entrada

### 4.2

Como segunda condición //despues de comprobar una caracteristica del paciente pero antes de usarlo en las comprobaciones del antecedente

### 4.3

Se inicializa un paciente con los valores por defecto y con la temperatura a nil. Ya que se instancia la plantilla en la base de hechos


### 5 ¿Cuál es la traza que se debe seguir para hacer las preguntas? Indíquela

preguntar temperatura?
preguntar exantema?
preguntar vacunado sarampión?
preguntar garganta irritada?
preguntar sarpullido?

## 6 : ¿Qué reglas debe añadir? Indíquelas. Pruébelas para la siguiente base de hechos inicial y diferentes valores de entrada de datos. En caso de que no se llegue a un diagnóstico, el sistema debe indicarlo en pantalla.

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

## 7 Diseñe un juego de pruebas (BH inicial + datos a introducir) suficientemente exhaustivo para que cubra todas las posibilidades. Anótelo en una tabla, junto a las respuestas de su programa Clips.

|Prueba/sintomas|fiebre           |sarpullido|exantema|garganta|vacunado |diagnóstico|
|---------------|-----------------|----------|--------|--------|---------|-----------|
|P1             |no baja moderada |          | si     |        |         |Alergia    |
|P2             |                 |          | si     |        | si      |Alergia    |
|P3             | no              | si       |        | no     | no      |Alergia    |
|P4             | alta            |          | si     |        | vacunado|Sarampión  |
|P5             | alta moderada   |          |        | si     |         |Gripe Común|

Las casillas en blanco deben ser probadas con todas los posibles valores para el campo
