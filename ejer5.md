#Practica 5 - CLIPS
## Diego Reiriz Cores

[TOC]
#### Cuestión 1: ¿Se trata de un problema de búsqueda? Si es así, responda a lo siguiente

##### 1) ¿Cómo representaría los estados (o situaciones) por los que pasa el problema?

Como un array de dos elementos, en el que cada elemento indica el grado de rellenado de cada jarra. Si acordamos que la primera jarra es la de  8L y el segundo elemendo la de 6L, tendríamos la siguiente representación.

  (8L,6L)

##### 2) ¿Cuál es el estado inicial?

  (0L,0L)

##### 3) ¿Cuál es el estado final?

 El estado final es aquel en el que la jarra de 8L contiene 4L, mientras que no es indiferente el contenido de la jarra de 6L

   (4L,XL)

##### 4) ¿Qué operadores se pueden aplicar? Son 8 en total.

op1: llenarJarra8(xi,yi)
  - precondiciones; xi<8
  - postcondiciones: (8,yi)

op2: llenarJarra6(xi,yi)
  - precondiciones; yi<6
  - postcondiciones: (xi,6)

op3: vaciarJarra8(xi,yi)
  - precondiciones; xi>0
  - postcondiciones: (0,yi)

op4: vaciarJarra6(xi,yi)
  - precondiciones; yi>0
  - postcondiciones: (xi,0)

op5: vaciarJarra8EnJarra6(xi,yi)
  - precondiciones; xi>0 && xi+yi <= 6
  - postcondiciones: (0,xi+yi)

op6: vaciarJarra6EnJarra8(xi,yi)
  - precondiciones; yi>0 && xi+yi <= 8
  - postcondiciones: (xi+yi,0)

op7: llenarJarra8ConParteJ6(xi,yi)
  - precondiciones; xi<8 && xi+yi >= 8
  - postcondiciones: (8,xi+yi-8)

op8: llenarJarra6ConParteJ8(xi,yi)
  - precondiciones; yi<6 && xi+yi >= 6
  - postcondiciones: (xi+yi-6,6)

#### Cuestión 2: Pruebe el programa. ¿Entra en un ciclo? Si lo hace, ¿a qué es debido?

Si que entra en un ciclo, porque cada vez que se ejecuta alguna de las reglas anteriores se crea un nuevo estado y se actualiza el hecho que lleva la cuenta del cicloa actual.

Esto produce que que el nodo que acaba de disparar una regla pueda volver a dispararla en combinación con el nuevo valor del hecho que lleva la cuenta  de los ciclos.

#### Cuestión 3: ¿Para qué sirve dicha condición?

Como se explica en la práctica

  La condición anterior evita generar nodos previamente generados (nodos repetidos).

Básicamente si se ha generado un nodo con un requisito en concreto, evitamos volver a generalo. Si llenamos jarra6, no vamos volver a intentar producir el nodo (0,6)

#### Cuestión 4: ¿El programa actual alcanza la solución? ¿Sigue ejecutándose una vez alcanzada la solución?

Si y Si. El programa alcanza la solución dos veces
