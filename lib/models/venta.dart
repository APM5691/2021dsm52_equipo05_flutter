class Venta {
  int id;
  int montoTotal;
  int direccionesId;
  int clientesId;

  Venta({this.id, this.montoTotal, this.direccionesId, this.clientesId});

  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      id: json['id'],
      montoTotal: json['monto_total'],
      direccionesId: json['direccione_iId'],
      clientesId: json['clientes_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "montoTotal": montoTotal,
      "direccionesId": direccionesId,
      "clientesId": clientesId,
    };
  }

  // @override
  // String toString() {
  //   return 'Producto{id: $id, tipoDeJoyaId: $tipoDeJoyaId, clave: $clave, nombreProducto: $nombreProducto, numeroExistencias: $numeroExistencias, precio: $precio, descripcion: $descripcion, medida: $medida, precioOferta: $precioOferta, fotografia: $fotografia}';
  // }
}
