// ignore: camel_case_types
class deatalleMaterial {
  int id;
  String nombre;
  String tipoMaterial;

deatalleMaterial({this.id, this.nombre, this.tipoMaterial });

  factory deatalleMaterial.fromJson(Map<String, dynamic> json) {
    return deatalleMaterial(
        id: json['id'],
        nombre: json['nombre'],
        tipoMaterial: json['tipo_material']);
  }

  Map<String, dynamic> toJson() {
    return 
    {"id": id, 
    "nombre": nombre, 
    "tipo_material": tipoMaterial};
  }
}
