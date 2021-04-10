import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/models/venta.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/producto_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/venta_screen.dart';
import '../dio.dart';
import '../models/producto.dart';

class VentasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VentasState();
  }
}

// enlazar a user y a direccion crear el venta screen y el crud

class VentasState extends State<VentasScreen> {
  Future<List<Venta>> getVentas() async {
    Dio.Response response = await dio()
        .get('ventas', options: Dio.Options(headers: {'auth': true}));
    // print(response.data.toString());
    List posts = json.decode(response.toString())['data'];
    return posts.map((post) => Venta.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas'),
        actions: <Widget>[
          _agregaProducto(),
          _recargarProductos(),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Venta>>(
            future: getVentas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data[index];
                      // return ListTile(title: Text(item.name));
                      return ListTile(
                        title: Text(item.montoTotal.toString()),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VentaScreen(venta: item)));
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Text('Falló la carga de Ventas');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  Widget _agregaProducto() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.orangeAccent),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          // print('agregar');
          Venta venta = Venta(
            id: 0,
            montoTotal: 0,
            direccionesId: 0,
            clientesId: 0,
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VentaScreen(venta: venta)));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarProductos() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.orangeAccent),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh));
  }
}
