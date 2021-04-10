import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/screen/material_screen.dart';

import '../dio.dart';
import '../models/material.dart';

class MaterialesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MaterialesState();
  }
}

// falta la pagina direccion y el funcionamiento del crud

class MaterialesState extends State<MaterialesScreen> {
  Future<List<Material1>> getMateriales() async {
    Dio.Response response = await dio()
        .get('materiales', options: Dio.Options(headers: {'auth': true}));
    // print(response.data.toString());
    List posts = json.decode(response.toString())['data'];
    return posts.map((post) => Material1.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materiales'),
        actions: <Widget>[
          _agregaMaterial(),
          _recargarMaterial(),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Material1>>(
            future: getMateriales(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data[index];
                      // return ListTile(title: Text(item.name));
                      return ListTile(
                        title: Text(item.nombre),
                        subtitle: Text(item.tipo_material),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MaterialScreen(material: item)));
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Text('Falló la carga de Materiales');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  // cambiar el redireccionamiento para de productos a materiales

  Widget _agregaMaterial() {
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
          Material1 material = Material1();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaterialScreen(
                        material: material,
                      )));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarMaterial() {
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
