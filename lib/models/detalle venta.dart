// ignore: camel_case_types
class detalleVenta {
     int   id;         
       String cantidad;                
        String subTotal;              
      int  ventaId;              
      int  productoId;

  detalleVenta({this.id, this.cantidad, this.subTotal, this.ventaId, this.productoId});

  factory detalleVenta.fromJson(Map<String, dynamic> json) {
    return detalleVenta(
      id: json['id'],
      cantidad: json['cantidad'],
      subTotal: json['sub_total'],
      ventaId: json['venta_id'],
      productoId: json['producto_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "cantidad": cantidad,
      "sub_total": subTotal,
      "venta_id": ventaId,
      "producto_id": productoId,

    };
  }

  // @override
  // String toString() {
  //   return 'Producto{id: $id, tipoDeJoyaId: $tipoDeJoyaId, clave: $clave, nombreProducto: $nombreProducto, numeroExistencias: $numeroExistencias, precio: $precio, descripcion: $descripcion, medida: $medida, precioOferta: $precioOferta, fotografia: $fotografia}';
  // }
}
