class Producto {
  // String id;
  // String nombreProducto;
  // String precioOferta;
  // String fotografia;
  // String descripcion;
  // String clave;
  // int numeroExistencias;
  // String precio;
  // int medida;
// String tipoDeJoyaId;

  int id;
  // int tipoDeJoyaId;
  String clave;
  String nombreProducto;
  int numeroExistencias;
  int precio;
  String descripcion;
  String medida;
  int precioOferta;
  String fotografia;

  Producto(
      { // this.tipoDeJoyaId,
      this.id,
      this.clave,
      this.nombreProducto,
      this.numeroExistencias,
      this.precio,
      this.descripcion,
      this.medida,
      this.precioOferta,
      this.fotografia});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
        id: json['id'],
        // tipoDeJoyaId: json['tipoDeJoyaId'],
        clave: json['clave'],
        nombreProducto: json['nombre_producto'],
        numeroExistencias: json['numero_existencias'],
        precio: json['precio'],
        descripcion: json['descripcion'],
        medida: json['medida'],
        precioOferta: json['precio_oferta'],
        fotografia: json['fotografia']

        // id: json['id'],
        // tipoDeJoyaId: int.parse(json['tipoDeJoyaId']),
        // clave: json['clave'],
        // nombreProducto: json['nombreProducto'],
        // numeroExistencias: int.parse(json['numeroExistencias']),
        // precio: double.parse(json['precio']),
        // descripcion: json['descripcion'],
        // medida: json['medida'],
        // precioOferta: double.parse(json['precioOferta']),
        // fotografia: json['fotografia']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'tipoDeJoyaId ': tipoDeJoyaId,
      "id": id,
      "clave": clave,
      "nombre_producto": nombreProducto,
      "numero_existencias": numeroExistencias,
      "precio": precio,
      "descripcion": descripcion,
      "medida": medida,
      "precio_oferta": precioOferta,
      "fotografia": fotografia
    };
  }

  // @override
  // String toString() {
  //   return 'Producto{id: $id, tipoDeJoyaId: $tipoDeJoyaId, clave: $clave, nombreProducto: $nombreProducto, numeroExistencias: $numeroExistencias, precio: $precio, descripcion: $descripcion, medida: $medida, precioOferta: $precioOferta, fotografia: $fotografia}';
  // }
}
