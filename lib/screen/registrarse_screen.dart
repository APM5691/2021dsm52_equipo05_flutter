import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/models/user.dart';
import '../dio.dart';

class RegistrarseScreen extends StatefulWidget {
  @override
  _RegistrarseScreenState createState() => _RegistrarseScreenState();
}

class _RegistrarseScreenState extends State {
  User user;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Crear ' + 'Editar ') + 'Registrarse')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _inputname(),
              Divider(),
              _inputemail(),
              Divider(),
              _inputprimerapellido(),
              Divider(),
              _inputsegundoapellido(),
              Divider(),
              _inputavatar(),
              Divider(),
              _inputsexo(),
              Divider(),
              _inputedad(),
              Divider(),
              _boton()
            ],
          )),
    );
  }

  Widget _inputname() {
    return TextFormField(
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre:',
          labelText: 'Nombre:',
          helperText: 'Nombre:',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.name = value;
      },
    );
  }

  Widget _inputemail() {
    return TextFormField(
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email:',
          labelText: 'Email:',
          helperText: 'Email:',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.email = value;
      },
    );
  }

  Widget _inputprimerapellido() {
    return TextFormField(
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Primer Apellido:',
          labelText: 'Primer Apellido',
          helperText: 'Primer Apellido',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.primerApellido = value;
      },
    );
  }

  Widget _inputsegundoapellido() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Segundo Apellido:',
          labelText: 'Segundo Apellido:',
          helperText: 'Segundo Apellido:',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.segundoApellido = value;
      },
    );
  }

  Widget _inputavatar() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fotografia',
          labelText: 'Fotografia',
          helperText: 'Fotografia',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.avatar = value;
      },
    );
  }

  Widget _inputsexo() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Sexo:',
          labelText: 'Sexo:',
          helperText: 'Sexo:',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.sexo = value;
      },
    );
  }

  Widget _inputedad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Edad:',
          labelText: 'Edad:',
          helperText: 'Edad:',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        user.edad = value;
      },
    );
  }

  Widget _boton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: Text('guardar'),
        onPressed: () {
          print("_submit");
          // _formKey.currentState.save();
          _submit();
        },
      ),
    );
  }

  void _alerta(BuildContext context, String titulo, String mensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(titulo),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mensaje),
                // FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _submit() async {
    print(user);

    Dio.Response response =
        await dio().post('usuarios', data: json.encode(user));

    if (201 == response.statusCode) {
      _alerta(context, 'Usuario', 'Usuario creado');
    }
  }
}
