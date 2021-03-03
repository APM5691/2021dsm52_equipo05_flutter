class Usuarios {
  String id;
  String name;
  String apellido;
  String avatar;
  String edad;

  Usuarios({this.id, this.name, this.apellido, this.avatar, this.edad});

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
        id: json['id'],
        name: json['name'],
        apellido: json['apellido'],
        avatar: json['avatar'],
        edad: json['edad']);
  }
}
