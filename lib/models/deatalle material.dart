class deatalleMaterial {
  int id;
  String nombre;
  String tipo_material;

deatalleMaterial({this.id, this.nombre, this.tipo_material });

  factory deatalleMaterial.fromJson(Map<String, dynamic> json) {
    return deatalleMaterial(
        id: json['id'],
        nombre: json['nombre'],
        tipo_material: json['tipo_material']);
  }

  Map<String, dynamic> toJson() {
    return 
    {"id": id, 
    "nombre": nombre, 
    "tipo_material": tipo_material};
  }
}
