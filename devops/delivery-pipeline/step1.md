Ejecuta el siguiente comando para **levantar tu Ambiente de Trabajo y conectarlo a tu repositorio de GitHub 'Pet Clinic'**. 

  `./prepare.sh`{{execute}}

*Pega en el terminal el GitHub 'Personal Access Token' que creaste en el módulo de Bienvenida. Si lo perdiste, ingresa a 
[https://github.com/settings/tokens](https://github.com/settings/tokens) para crear un nuevo token, grábalo para usarlo después.*

*El script puede tomar algunos minutos en ejecutarse.*

Espera el mensaje "**Click on 'CONTINUE'**"

💡 **TIP**: 🦊 ¿Usas Firefox? es probable que el token no se copie con <kbd>CTRL</kbd>+<kbd>V</kbd>.
Usa <kbd>CTRL</kbd>+<kbd>INS</kbd> para copiar el token y <kbd>SHIFT</kbd>+<kbd>INS</kbd> para pegarlo en la ventana del terminal.

**1. Aprobación del tester para iniciar el despliegue en el ambiente de Test** 

* Entre la línea 47 y 48, debajo del bloque `stage('Deploy Development'){..}`, agrega las siguientes líneas:

  <pre class="file" data-target="clipboard">
  stage('Decide Deploy to Test'){
        when {
            branch 'master'
        }
        agent none
        steps {
            input message: 'Deploy to Test?'
        }            
  }
  </pre> 

  ✏ **Nota**: la directiva `when { branch 'master' }` le indica al pipeline que el stage solo se ejecutará en la rama `master`.

  ✏ **Nota**: el step `input` pausa la ejecución del pipeline y permite a una persona interactuar y controlar el flujo del pipeline (continuar o cancelar, proveer información).

**2. Desplegar en Test** 

* El despliegue consiste en detener el contenedor anterior y ejecutar la nueva versión del contenedor.

* Debajo del bloque `stage('Decide Deploy to Test'){..}`, agrega las siguientes líneas:

<pre class="file" data-target="clipboard">
stage('Deploy Test'){
    when {
        branch 'master'
    }
    agent any
    steps {
        sh '''
            for runName in `docker ps | grep "alpine-petclinic-test" | awk '{print $1}'`
            do
                if [ "$runName" != "" ]
                then
                    docker stop $runName
                fi
            done
            docker run --name alpine-petclinic-test --rm -d -p 9967:8080 $TAG_NAME
        '''
    }
}
</pre> 

    ✏ **Nota**: el step `sh` ejecuta cualquier script de linux.
    
  ✏ **Nota**: el step `sh` ejecuta cualquier script de linux.