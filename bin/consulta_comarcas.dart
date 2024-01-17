import 'comarca.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;


void main(List<String> args) async {
  // Verificamos que tenga los argumentos necesarios
  if (args.isEmpty) {
    print('Faltan argumentos en la consulta. Prueba: dart run consulta_comarcas.dart [comando] [nombreProvincia/nombreComarca]');
    return;
  }

  try {
    // Comprobamos el comando y el nombre pasado y llamamos a la función correspondiente en cada caso o mostramos el error
    var comando = args[0];
    var nombre = args.sublist(1).join(' ');

    if (comando == 'comarques') {
      var listaComarcas = await getComarcas(nombre);
      print(listaComarcas);
    }
    else if (comando == 'infocomarca') {
      var infoComarcaJson = await getInfoComarcas(nombre);
      var detallesComarca = Comarca.fromJSON(infoComarcaJson);
      print(detallesComarca.toString());
    }
    else {
      print('Comando no disponible.');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<List<dynamic>> getComarcas(String provincia) async {
  final url ='https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia';
  var respuesta = await http.get(Uri.parse(url));

  if (respuesta.statusCode == 200) {
    return jsonDecode(respuesta.body);
  } else {
    print('Código de Estado: ${respuesta.statusCode}');
    throw Exception('Error en la solicitud de $provincia');
  }
}

Future<Map<String, dynamic>> getInfoComarcas(String comarca) async {
  final url ='https://node-comarques-rest-server-production.up.railway.app/api/comarques/infocomarca/$comarca';
  var respuesta = await http.get(Uri.parse(url));

  if (respuesta.statusCode == 200) {
    return jsonDecode(respuesta.body);
  } else {
    throw Exception(
        'Error en la solicitud de la informacion de la comarca $comarca');
  }
}
