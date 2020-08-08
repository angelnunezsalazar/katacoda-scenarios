Vamos a agregar nuevos cambios al Pull Request para corregir el error.

* Ingresa al listado de pull requests de GitHub en tu navegador [https://github.com/[your_username]/pet-clinic/pulls](https://[[HOST_SUBDOMAIN]]-9876-[[KATACODA_HOST]].environments.katacoda.com/#pr)
* Abre el pull request que tienes en progreso.

* En el tab "**Files changed**", edita el archivo `data.sql`.

* Reemplaza la línea "Jolly Jumper, con la siguiente línea `INSERT INTO pets VALUES (14, 'Jolly Jumper', '2012-09-20', 7, 5);`{{copy}}

* En la caja **Commit changes**, ingresa un comentario `Fix parenthesis`{{copy}}

* Realiza commit del código en la misma rama (por ejemplo `us-1-horse-db`).

* Luego de esto, el pipeline de Jenkins volverá a ejecutarse. Ingresa a <a href="https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/blue/organizations/jenkins/pet-clinic/" target="jenkins">Jenkins</a> para revisar la ejecución. Todas las etapas del pipeline deberían pasar.