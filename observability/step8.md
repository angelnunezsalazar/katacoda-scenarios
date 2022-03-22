## Corregir los Problemas

**Apagar todos los servicios**

Ejecuta el siguiente comando para apagar todos los servicios.

`docker-compose -f ecommerce-observability/docker-compose.yml down -d`{{execute}}

**Aplicar un parche para corregir el problema**

Ejecuta el siguiente comando para aplicar un parche que tiene la corrección a todos los problemas.

`source ./prepare.sh`{{execute}}

**Cambiar la versión**

**Levantar todos los servicios**

## Comparar el desempeño de las ambas versiones de la aplicación

**Revisar las versiones de la aplicación desplegadas**

Ingresa a la lista de servicios, en el menú de la izquierda ingresa a `APM` > `Services`.

Haz click en el servicio `store-frontend` para ver su detalle.

Desplázate hacia abajo, hasta la sección `Deployments`.

Observarás 2 deployments.
- `TBD`: la versión con los errores y lentitud.
- `TBD`: la versión con las correcciones y que acabamos de levantar.

**Comparar el desempeño de ambas versiones**