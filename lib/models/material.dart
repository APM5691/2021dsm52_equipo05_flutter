class Material1 {
  int id;
  String nombre;
  String tipo_material;

  Material1({
    this.id,
    this.nombre,
    this.tipo_material,
  });

  factory Material1.fromJson(Map<String, dynamic> json) {
    return Material1(
        id: json['id'],
        nombre: json['nombre'],
        tipo_material: json['tipo_material']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "tipo_material": tipo_material,
    };
  }
}
