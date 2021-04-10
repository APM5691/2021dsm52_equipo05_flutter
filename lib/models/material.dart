class Material1 {
  int id;
  String nombre;
  String tipoMaterial;

  Material1({
    this.id,
    this.nombre,
    this.tipoMaterial,
  });

  factory Material1.fromJson(Map<String, dynamic> json) {
    return Material1(
        id: json['id'],
        nombre: json['nombre'],
        tipoMaterial: json['tipo_material']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nombre": nombre, "tipo_material": tipoMaterial};
  }
}
