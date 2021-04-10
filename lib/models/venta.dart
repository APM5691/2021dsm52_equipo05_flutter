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
      direccionesId: json['direcciones_id'],
      clientesId: json['clientes_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "monto_total": montoTotal,
      "direcciones_id": direccionesId,
      "clientes_id": clientesId,
    };
  }
}
