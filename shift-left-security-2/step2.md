## Actualiza el archivo pom.xml para remover dependencias sin usar

* Ingresa a [`github.com`](https://github.com) e ingresa a tu repositorio **pet-clinic**.

* Abre el archivo **pom.xml**

* Para editar el archivo, has click en el **ícono de lapiz** en la parte superior derecha del archivo.

* Aproximadamente **entre las líneas 48 y 57** se encuentran 2 dependencias de la librería `tomcat-embed`, remueve por completo ambas dependencias.

* En la sección **Commit changes**, ingresa el comentario `Remove tomcat-embed`{{copy}}.

* Realiza commit en la misma rama `master`.

## Levanta tu ambiente de trabajo

Ejecuta el siguiente comando para **levantar tu Ambiente de Trabajo y conectarlo a tu repositorio de GitHub 'Pet Clinic'**. 

  `./prepare.sh`{{execute}}

*Pega en el terminal el GitHub 'Personal Access Token' que creaste en el módulo de Bienvenida. Si lo perdiste, ingresa a 
[https://github.com/settings/tokens](https://github.com/settings/tokens) para crear un nuevo token, grábalo para usarlo después.*

*El script puede tomar algunos segundos en ejecutarse.*

Espera el mensaje **Click on 'CONTINUE'**.

💡 **TIP**: 🦊 ¿Usas Firefox? es probable que el token no se copie con <kbd>CTRL</kbd>+<kbd>V</kbd>.
Usa <kbd>CTRL</kbd>+<kbd>INS</kbd> para copiar el token y <kbd>SHIFT</kbd>+<kbd>INS</kbd> para pegarlo en la ventana del terminal.