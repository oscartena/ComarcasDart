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
      : comarca = json['nombre'],
        capital = json['capital'],
        poblacion = json['poblacion'],
        img = json['img'],
        desc = json['desc'],
        latitud = (json['coordenadas'] as List<dynamic>?)
                ?.elementAt(0)
                ?.toDouble() ?? 0.0,
        longitud = (json['coordenadas'] as List<dynamic>?)
                ?.elementAt(1)
                ?.toDouble() ?? 0.0;


  @override
  String toString() {
    return 'nombre: $comarca\n'
        'capital: ${capital ?? "No disponible"}\n'
        'población: ${poblacion ?? "No disponible"}\n'
        'Imagen: ${img ?? "No disponible"}\n'
        'descripción: ${desc ?? "No disponible"}\n'
        'Coordenadas: ($latitud, $longitud)';
  }
}