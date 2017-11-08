La funcionalidad del reloj se expone a través de un servicio web, este servicio  puede ser consultado directamente en el navegador. 

Este servicio se encuentra en la url `https://relojdespertador.herokuapp.com/api/alarma/sonar` y recibe 2 parámetros:
- `hora-alarma`: hora en la cual debe sonar la alarma
- `hora-actual`: hora que quiero averiguar si hace sonar la alarma o no
Y retorna
- `sonar`: indica si la alarma está sonando o no

Copia la siguiente url y pégala en tu navegador:
`https://relojdespertador.herokuapp.com/api/alarma/sonar?hora-alarma=07:20&hora-actual=07:19`

Revisa brevemente el resultado.