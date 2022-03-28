Como Petclinic es un proyecto Java, podemos fácilmente agregar `OWASP Dependency Check` a través del archivo `pom.xml` y luego llamar al comando que lo ejecuta desde el `Jenkinsfile`.

## Agrega Dependency Check en el POM

* Abre Github y navega hasta el archivo [`pom.xml`](https://[[HOST_SUBDOMAIN]]-9876-[[KATACODA_HOST]].environments.katacoda.com/#pom) del repositorio Pet Clinic.

* Para editar el archivo, has click en el **ícono de lapiz** en la parte superior derecha del archivo.

* Aproximadamente **debajo de línea 293**, debajo de `</plugin>` sin `s`, presiona `ENTER` y agrega el siguiente fragmento:

  <pre class="file" data-target="clipboard">
  &lt;plugin&gt;
          &lt;groupId&gt;org.owasp&lt;/groupId&gt;
          &lt;artifactId&gt;dependency-check-maven&lt;/artifactId&gt;
          &lt;version&gt;6.1.5&lt;/version&gt;
          &lt;configuration&gt;
                  &lt;format&gt;ALL&lt;/format&gt;
                  &lt;failBuildOnCVSS&gt;9&lt;/failBuildOnCVSS&gt;
          &lt;/configuration&gt;
          &lt;executions&gt;
                  &lt;execution&gt;
                          &lt;goals&gt;
                                  &lt;goal&gt;check&lt;/goal&gt;
                          &lt;/goals&gt;
                  &lt;/execution&gt;
          &lt;/executions&gt;
  &lt;/plugin&gt;
  </pre>

  ✏ **Notas**: 
  - `CVSS` (Common Vulnerability Scoring System) proporciona un valor númerico que refleja la severidad de una vulnerabilidad. Más información de CVSS en [https://www.first.org/cvss/v3.1/user-guide](https://www.first.org/cvss/v3.1/user-guide).
  - El build fallará si `CVSS >=9` (severidad crítica), el valor depende del contexto de cada proyecto y de donde quieres poner el umbral.

* En la sección **Commit changes**, ingresa el comentario `OWASP Dependency Check: pom.xml`{{copy}}

* Realiza commit en una nueva rama `deps-check`{{copy}}.

* Click en el botón **Propose Changes** para iniciar la creación del Pull Request. 
  
* Sigue los pasos hasta **finalizar la creación del Pull Request**.

## Agrega la llamada en el Pipeline

* Abre el archivo [`Jenkinsfile`](https://[[HOST_SUBDOMAIN]]-9876-[[KATACODA_HOST]].environments.katacoda.com/#jenkinsfile-deps-check) de la rama `deps-check`, 

* Para editar el archivo, has click en el **ícono de lapiz** en la parte superior derecha del archivo.

* Debajo del bloque `stage('Publish Tests Results'){..}`, agrega el siguiente fragmento:

  <pre class="file" data-target="clipboard">
  stage('Dependency check') {
      agent any
      steps {
          sh "mvn --batch-mode dependency-check:check"
      }
      post {
          always {
              dependencyCheckPublisher pattern: 'target/dependency-check-report.xml'
              publishHTML(target:[
                  allowMissing: true,
                  alwaysLinkToLastBuild: true,
                  keepAll: true,
                  reportDir: 'target',
                  reportFiles: 'dependency-check-report.html',
                  reportName: "OWASP Dependency Check Report"
              ])
          }
      }
  }
  </pre>

* En la sección **Commit changes**, ingresar el comentario `OWASP Dependency Check: Jenkinsfile`{{copy}}

* Realiza commit en la misma rama `deps-check`.