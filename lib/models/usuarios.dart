class Usuarios {
  int id;
  String name;
  String primerApellido;
  String avatar;
  String edad;

  Usuarios({this.id, this.name, this.primerApellido, this.avatar, this.edad});

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
        id: json['id'],
        name: json['name'],
        primerApellido: json['primer_apellido'],
        avatar: json['avatar'],
        edad: json['edad']);
  }
}
