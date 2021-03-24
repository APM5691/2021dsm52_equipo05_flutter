class Direccion {
  int id;
  int clientesId;
  String calle;
  int numero;
  String localidad;
  String municipio;
  String estado;

  Direccion({
    this.id,
    this.clientesId,
    this.calle,
    this.numero,
    this.localidad,
    this.municipio,
    this.estado,
  });

  factory Direccion.fromJson(Map<String, dynamic> json) {
    return Direccion(
        id: json['id'],
        clientesId: json['clientes_id'],
        calle: json['calle'],
        numero: json['numero'],
        localidad: json['localidad'],
        municipio: json['municipio'],
        estado: json['estado']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "clientesId": clientesId,
      "calle": calle,
      "numero": numero,
      "localidad": localidad,
      "municipio": municipio,
      "estado": estado
    };
  }

  // @override
  // String toString() {
  //   return 'Producto{id: $id, tipoDeJoyaId: $tipoDeJoyaId, clave: $clave, nombreProducto: $nombreProducto, numeroExistencias: $numeroExistencias, precio: $precio, descripcion: $descripcion, medida: $medida, precioOferta: $precioOferta, fotografia: $fotografia}';
  // }
}
