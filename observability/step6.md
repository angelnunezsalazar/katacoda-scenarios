## Analizar el Problema

**Revisar la métrica de errores**

En la pantalla con el `listado de servicios` haz click en `store-frontend` para ver el detalle de información.

![Service Detail](./assets/service-detail.png)

Observa que el gráfico de `Total Errors` muestra varios errores en la línea de tiempo.

![service-front-errors](./assets/break.png)

Desplázate hacia abajo para ver el disgregagado de los `endpoints` y cuáles podrían estar causando el problemas.

Ordena la tabla de endpoints por `Error Rate` haciendo click en el título de su columna correspondiente.

![service-front-endpoints](./assets/break.png)

**Profundizar en los errores**

Para revisar todos los logs, en el menu de la izquierda ingresa a `Logs` > `Search`.

Filtra para que muestre solo los `Status:Error` y `Service:store-frontends`.

Haz click sobre cualquiera de logs de error para ver su detalle.

![service-front-endpoints](./assets/break.png)

Observarás el `span` las llamadas dentro de `store-front`.

Haz click sobre el span `xxx`, y luego en la ventana inferior haz clic sobre el tab `Errors`.

Observarás la línea exacta donde se está generando el error **COMPLETAME*.

Parece que se está intentando mostrar un archivo incorrecto.

(Opcional) Puedes ingresar a diferentes traces para observar el mismo comportamiento.

**Abre el archivo con el problema**

TBD

En los siguientes pasos corregiremos el problema.