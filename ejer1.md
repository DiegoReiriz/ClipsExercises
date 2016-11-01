# ENCO - Practica 1 - Diego Reiriz Cores 

## Ejercicio 1

### ¿Qué devuelve Clips al añadir un hecho a la Base de Hechos (BH)?

El numero de hecho que se ha añadido

### ¿Por qué en un caso devuelve False? 

Porque el hecho (apelliddo-1 Perez) esta repetido


## Ejercicio 2

### ¿Se ha activado alguna regla?

La primera

### ¿Qué hechos activan cada regla?

	(nombre Juan) (f2,f4)
	(nombre Juan)(apellido-1 Perez) (f2)

## Ejercicio 3

### ¿Qué regla se ejecuta primero?¿Por qué? 

R2 f-2,f-4 ,porque tiene el número de hecho mas alto.

### ¿Qué pasa si reiniciamos con (clear)? 

Con *clear* vaciamos todo, motor de hechos,reglas,agenda.

## Ejercicio 4

### Si se introducen los hechos con (deffacts), y se carga el fichero ¿qué ocurre en la BH y
en la Agenda?

Se cargan las posibles reglas que se pueden ejecutar por defecto en la agenda

### Ejecute (reset). ¿Qué ocurre en la BH y en la Agenda? 

Se cargan las reglas en el motor de reglas, pero no los hechos en el motor de hechos

### ¿Cuál es el primer hecho que se ha activado? 

Al hacer reset se cargan los hechos en el motor de hechos/base de conocimiento

## Ejercicio 5

### ¿Qué devuelve el programa cuando el robot es un coche y el semáforo para los coches está en rojo? Copie y pegue el resultado mostrado en la dialog window tras ejecutar (run). 

	CLIPS> (facts)
	f-0     (initial-fact)
	f-1     (tipo-robot chofer)
	f-2     (semaforo rojo)
	For a total of 3 facts.

	Que tipo de robot es (chofer/peaton)? chofer
	Semaforo para los coches? rojo
	El robot chofer debe esperar

	CLIPS> (facts)
	f-0     (initial-fact)
	f-1     (tipo-robot chofer)
	f-2     (semaforo rojo)
	For a total of 3 facts.

