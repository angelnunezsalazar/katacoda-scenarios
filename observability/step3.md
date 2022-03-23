## Mapa de los Servicios de la Aplicación

Ingresa a Datadog <a href="https://app.datadoghq.com/" target="datadog">https://app.datadoghq.com/</a>.

Para observar mapa en tiempo real de todos los servicios (componentes) de la aplicación y sus dependencias, en el menu de la izquierda ingresa a **APM > Service Map**.

![Service Map](./assets/service-map.png)

**Nota**: Espera un par de minutos hasta que el mapa aparezca, esto también ayuda a confirmar que Datadog ya está recibiendo la información.

Este mapa descompone la aplicación en todos sus servicios y pinta las dependencias en tiempo real, de tal manera que puedas identificar rápidamente cuellos de botella y cómo fluye la información en tu arquitectura

Por cada servicio observarás 3 métricas muy importantes:
- `Requests`: cantidad de llamadas por segundo.
- `Latency`: tiempo de respuesta.
- `Error`: Porcentage de requests que presentaron error.

Asimismo, en caso algún componente presente alguna alerta, este aparecerá pintado de un color diferente.