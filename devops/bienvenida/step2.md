
## Repositorio de Código Fuente

Para avanzar en los laboratorios, usarás una copia propia del repositorio de código de **Pet Clinic**. Tu repositorio de código se encontrará en **[GitHub](https://github.com/).**

Si bien los ambientes son efímeros, todo tu progreso se irá grabando en tu repositorio de código. 

### Asegúrate de tener una cuenta en Github

* Si no tienes una cuenta en Github, créate una cuenta personal en [github.com](https://github.com) (te pedirá confirmar el correo para que la cuenta esté usable).

## Realiza una Copia del Repositorio base

* Ingresa a [[github.com](https://github.com/snahider/pet-clinic)](https://github.com/snahider/pet-clinic)

* En la parte superior derecha de la pantalla, haz clic **Fork**.

* Si tu cuenta pertenece a varias organizaciones, te aparecerá la página **Where should we fork pet-clinic**, selecciona tu perfil.

* Espera a que termine el proceso, demorará unos segundos.

* Al finalizar la copia aparecerá el repositorio asociado a tu cuenta y verás la estructura de archivos del mismo.

### Genera un 'Personal Access Token'

Generarás un token de acceso que se utilizará para conectar los ambientes de trabajo a tu copia de GitHub.

* Ingresa a [github.com](https://github.com)
* Click en el **ícono de tu perfil** en la parte superior derecha de la página, luego click en **Settings.**
* En el menú de la izquierda, click en **Developer settings** y luego click en **Personal access tokens.**
* Click en **Generate new token.**
* Ingresa una descripción del token, por ejemplo `DevOps Labs token`{{copy}}
* En **Select Scopes** selecciona `repo` para que el token pueda leer y escribir en tu repositorio, y `admin:repo_hook` para que se pueda crear Web Hooks.
* Click en **Generate token.**
* **Copia el token y guárdalo en tus notas, se necesitará a lo largo de los laboratorios.** Si pierdes el token, tendrás que generar uno nuevo.

### Generar Backlog de Trabajo

Ejecuta el siguiente script para generar algunas historias de usuario que se implementarán posteriormente.

  `./copy-pet-clinic.sh`{{execute}}

Este script te pedirá **ingresar tu Personal Access Token**.