class Comarca {
  String comarca;
  String? capital;
  String? poblacion;
  String? img;
  String? desc;
  double? latitud;
  double? longitud;

  //Constructor
  Comarca({
    required this.comarca,
    this.capital,
    this.poblacion,
    this.img,
    this.desc,
    this.latitud,
    this.longitud,
  });

  // Constructor desde un JSON
  Comarca.fromJSON(Map<String, dynamic> json)
      : comarca = json['nombre'] ?? 'Nombre no disponible',
        capital = json['capital'],
        poblacion = json['poblacion'],
        img = json['img'],
        desc = json['desc'],
        latitud = _parseCoordenada(json, 0),
        longitud = _parseCoordenada(json, 1);

  static double? _parseCoordenada(Map<String, dynamic> json, int index) {
  return json['coordenadas'] != null ? json['coordenadas'][index] : null;
  }


  @override
  String toString() {
    return 'nombre: $comarca\n'
        'capital: ${capital ?? "No disponible"}\n'
        'población: ${poblacion ?? "No disponible"}\n'
        'Imagen: ${img ?? "No disponible"}\n'
        'descripción: ${desc ?? "No disponible"}\n'
        'Coordenadas: (${_formatCoordenada(latitud)}, ${_formatCoordenada(longitud)})';
  }

  String _formatCoordenada(double? coordenada) {
    return coordenada?.toStringAsFixed(7) ?? 'No disponible';
  }
}