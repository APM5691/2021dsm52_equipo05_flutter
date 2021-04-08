import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/models/direccion.dart';

import '../dio.dart';


class DireccionesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DireccionesState();
  }
}

// falta la pagina direccion y el funcionamiento del crud

class DireccionesState extends State<DireccionesScreen> {
  Future<List<Direccion>> getDirecciones() async {
    Dio.Response response = await dio()
        .get('direcciones', options: Dio.Options(headers: {'auth': true}));
    // print(response.data.toString());
    List posts = json.decode(response.toString())['data'];
    return posts.map((post) => Direccion.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direcciones'),
        actions: <Widget>[
          _agregaDireccion(),
          _recargarDireccion(),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Direccion>>(
            future: getDirecciones(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data[index];
                      // return ListTile(title: Text(item.name));
                      return ListTile(
                        title: Text(item.calle),
                        subtitle: Text(item.numero.toString()),
                        leading: Text(item.localidad +
                            ' \n' +
                            item.municipio +
                            ' \n' +
                            item.estado),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          // log('Agregar al carrito: ' + item.id.toString());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             ProductoScreen(producto: item)));
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Text('Falló la carga de Direcciones');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  // cambiar el redireccionamiento para de productos a materiales

  Widget _agregaDireccion() {
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
          Direccion direccion = Direccion();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) = DireccionScreen(direccion: direccion)));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarDireccion() {
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
