Consulta de Comarcas en el País Valencià a través de consola

Este programa de línea de comandos en Dart te permite obtener información sobre las comarcas y provincias del País Valencià utilizando un API REST. Puedes consultar un listado de comarcas para una provincia indicada o obtener información detallada sobre una comarca específica.

Requisitos Previos
Asegúrate de tener Dart y Flutter instalados en tu entorno de desarrollo. Además, el programa utiliza la biblioteca http para realizar solicitudes HTTP, por lo que asegúrate de que las dependencias estén instaladas.

La aplicación presenta dos comandos principales:
comarques: Para obtener un listado de comarcas de una provincia.
infocomarca: Para obtener información detallada sobre una comarca específica.

Uso
Ejecuta el programa desde la línea de comandos utilizando el siguiente formato:
dart run consulta_comarcas.dart [comando] [nombreProvincia/nombreComarca]

Ejemplos de Uso
dart run consulta_comarcas.dart comarques Castelló


