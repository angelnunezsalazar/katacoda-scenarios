## Simular Tráfico Automáticamente

Utilizaremos pruebas automatizadas sobre el navegador para simular tráfico en la aplicación.
Ejecutaremos estas pruebas en un bucle continuo y en varios navegadores en simultáneo.

Debido a que la instancia actual ya tiene muchas cosas ejecutándose, lanzaremos estas pruebas en otra instancia diferente.

Realiza los siguientes pasos para simular tráfico:
* Inicia un **nuevo laboratorio** abriendo el siguiente enlace en otro tab <a href="https://www.katacoda.com/snahider/scenarios/observability" 
  target="jenkins">https://www.katacoda.com/snahider/scenarios/observability</a>
* Copia este comando `export STOREDOG_URL='https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/'`{{copy}} y ejecútalo en el terminal del **nuevo laboratorio**.
* Copia este comando `./startTraffic.sh`{{copy}} y ejecútalo en el terminal del **nuevo laboratorio**.
* Espera el mensaje **Click on 'CONTINUE'**.
* Asegúrate de regresar al **laboratorio original**.

