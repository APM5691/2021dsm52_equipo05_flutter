import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/usuarios.dart';

import '../dio.dart';

class DetalleUsuariosScreen extends StatefulWidget {
  final String id;
  DetalleUsuariosScreen({Key key, this.id}) : super(key: key);
  @override
  _DetalleUsuariosState createState() => _DetalleUsuariosState();
}

class _DetalleUsuariosState extends State<DetalleUsuariosScreen> {
  Future<List<Usuarios>> getDetalleUsuarios() async {
    Dio.Response response = await dio().get('/usuarios/2'

        // , options: Dio.Options(headers: {'auth': true})
        );

    List posts = json.decode(response.toString());

    return posts.map((post) => Usuarios.fromJson(post));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Usuario"),
      ),
      body: Center(
        child: Container(
          child: Text(
            widget.id,
          ),
        ),
      ),
    );
  }
}
