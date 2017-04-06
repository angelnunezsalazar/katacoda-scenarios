Realiza los siguientes pasos:

1) Abre la clase `./features/alarma.feature`.

    Every .feature file conventionally consists of a single feature. A line starting with the keyword Feature followed by free indented text starts a feature.

    Cada archivo .feature por convención corresponde a una única funcionalidad.
    Una funcionalidad  comienza con la palabra clave Feature seguida por texto identado.

2) Identifica los 2 escenarios de pruebas.

    Una funcionalidad contiene una lista de escenarios, cada escenario comienza con la palabra Scenario (o su versión en el lenguaje elegido, Cucumber soporta muchos lenguajes).
    
    Cada escenario consiste en una lista de pasos (steps), que deben empezar con las palabras Given, When, Then, But o And (o su versión en otros lenguajes). Cucumber no hace diferencias entre esas palabras, pero tu deberías usarlas correctamente para que que quede claro el objetivo del escenario.

3) Desde el terminal ejecuta todas las pruebas `make cucumber`{{execute}}.

4) Examina el resultado de la ejecución, todas las pruebas deben pasar.





