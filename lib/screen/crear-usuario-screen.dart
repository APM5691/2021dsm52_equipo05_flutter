import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:provider/provider.dart';

class CrearUsuarioScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CrearUsuarioState();
  }
}

class CrearUsuarioState extends State<CrearUsuarioScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _apellido;
  String _avatar;
  String _edad;

  void submit() {
    Provider.of<Auth>(context, listen: false).login(credentials: {
      'name': _name,
      'apellido': _apellido,
      'avatar': _avatar,
      'edad': _edad,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crear Usuario"),
        ),
        body: Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  TextFormField(
                      initialValue: 'Nombre',
                      decoration: InputDecoration(
                          labelText: "Nombre", hintText: "Jose luis"),
                      onSaved: (value) {
                        _name = value;
                      }),
                  TextFormField(
                      initialValue: 'Apellido',
                      decoration: InputDecoration(labelText: "Apellido"),
                      onSaved: (value) {
                        _apellido = value;
                      }),
                  TextFormField(
                      initialValue: 'Avatar',
                      decoration: InputDecoration(
                          labelText: "Avatar", hintText: "Avatar"),
                      onSaved: (value) {
                        _avatar = value;
                      }),
                  TextFormField(
                      initialValue: 'Edad',
                      decoration: InputDecoration(labelText: "Edad"),
                      onSaved: (value) {
                        _edad = value;
                      }),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("Crear un nuevo usuario"),
                      onPressed: () {
                        _formKey.currentState.save();

                        this.submit();
                      },
                    ),
                  )
                ]),
              ),
            )));
  }
}
