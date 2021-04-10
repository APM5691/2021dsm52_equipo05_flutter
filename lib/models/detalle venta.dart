class detalleVenta {
     int   id;         
       String cantidad;                
        String sub_total;              
      int  venta_id;              
      int  producto_id;

  detalleVenta({this.id, this.cantidad, this.sub_total, this.venta_id, this.producto_id});

  factory detalleVenta.fromJson(Map<String, dynamic> json) {
    return detalleVenta(
      id: json['id'],
      cantidad: json['cantidad'],
      sub_total: json['sub total'],
      venta_id: json['venta_id'],
      producto_id: json['producto_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "cantidad": cantidad,
      "sub total": sub_total,
      "venta_id": venta_id,
      "producto_id": producto_id,

    };
  }

  // @override
  // String toString() {
  //   return 'Producto{id: $id, tipoDeJoyaId: $tipoDeJoyaId, clave: $clave, nombreProducto: $nombreProducto, numeroExistencias: $numeroExistencias, precio: $precio, descripcion: $descripcion, medida: $medida, precioOferta: $precioOferta, fotografia: $fotografia}';
  // }
}
