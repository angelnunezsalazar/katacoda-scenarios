Ahora que todas las verificaciones automáticas han pasado. Es momento de involucrar a Tina la tester  a que realice una revisión de pares.

![](../assets/team/tina.png)

✏ Note: Tina es la aplicación de bot que agregaste al inicio.

* En el pull request, agrega un comentario para preguntar a Tina que revise el pull request: `/tina - can you have a look at this?`{{copy}}

* Tina luego de revisar los cambios, te pedirá que cambies 

* Implementa los cambios ingresando al tab "**Files changed**", haciendo click en el ícono de lapiz al lado del archivo `data.sql`. Guarda los cambios sobre la misma rama.

* Jenkins ejecutará nuevamente el pipeline con el último cambio para asegurarse que todas las verificaciones están pasando. Opcionalmente puedes ver la ejecución en Jenkins <a href="https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/blue/organizations/jenkins/pet-clinic/pr" target="jenkins">https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/blue/organizations/jenkins/pet-clinic/pr</a>
* 
* Cuando el pipeline haya finalizado OK, en el pull request aparecerá el mensaje **everything is green!**.