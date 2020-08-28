El delivery pipeline que implementaremos tendrá la siguientes características.

* **Iniciará apenas se detecte un cambio en la rama `Master`**.
* **Incluirá algunas actividades del pipeline de Continuous Integration**: Compilar, Pruebas Unitarias,  Pruebas de Integración, Publicar la Imagen Docker.
* Tendrá actividades adicionales que permitan **llevar la imagen docker a través del ambiente de test hasta producción**.
* Tendrá **actividades automatizadas** (Desplegar, Pruebas End-to-End) **y actividades manuales** (Aprobaciones)

En los siguienes pasos agregarás las nuevas actividades al pipeline.