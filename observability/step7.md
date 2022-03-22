## Analizar el Problema

**Revisar el Latency de los Endpoints**

Regresar a la pantalla con el `listado de servicios` haz click en `store-frontend` para ver el detalle de información.

Desplázate hacia abajo para ver el listado `endpoints`, ordénalos por `Avg Latency` para identificar donde se encuentra el problema.

![endpoints-sorted-latency](./assets/break.png)

**Profundizar en la lentitud**

Hay varios endpoints con lentitud.

Comienza haciendo click sobre el endpoint `Spree::ProductsController#show`.

**TBD** En la nueva página, desplázate hacia abajo hasta encontrar los últimos traces `traces`

![endpoint-controler-traces](./assets/break.png)

Haz click sobre el primero de los traces para ver el detalle.

Observarás el `span` de las llamadas desde el front hasta la BD.

![endpoints-controller-span](./assets/break.png)

Haz click en el tab `Span list` y ordena los span por `exec time`.

Observarás que el span que tiene el mayor tiempo de respuesta es **advertisements-service > /ads**

**Abre el archivo con el problema**

En un próximo paso corregiremos el problema.

**(Opcinoal) Identifica el resto de problemas de lentitud**

Hay otros endpoints con problemas de lentitud, realiza los pasos anterior para identificar el lugar exacto de la lentitud.

![endpoints-sorted-latency](./assets/break.png)