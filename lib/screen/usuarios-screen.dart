import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/usuarios.dart';

import '../dio.dart';

class UsuariosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<UsuariosScreen> {
  Future<List<Usuarios>> getUsuarios() async {
    Dio.Response response = await dio().get('/usuarios'
        // , options: Dio.Options(headers: {'auth': true})
        );

    print(response.data.toString());

    List posts = json.decode(response.toString());

    return posts.map((post) => Usuarios.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
      ),
      body: Center(
        child: FutureBuilder<List<Usuarios>>(
          future: getUsuarios(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, prueba) {
                    var item = snapshot.data[prueba];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.apellido),
                      trailing: Image.network(item.avatar),
                    );
                  });
            } else if (snapshot.hasError) {
              log(snapshot.error.toString());
              return Text('Failes to load posts');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
