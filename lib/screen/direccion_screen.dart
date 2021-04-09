import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;

import '../dio.dart';
import '../models/direccion.dart';

class DireccionScreen extends StatefulWidget {
  final Direccion direccion;

  DireccionScreen({Key key, this.direccion}) : super(key: key);

  @override
  _DireccionScreenState createState() => _DireccionScreenState();
}

class _DireccionScreenState extends State<DireccionScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Crear ' + 'Editar ') + 'direccion')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _inputid(),
              Divider(),
              _inputclientesId(),
              Divider(),
              _inputcalle(),
              Divider(),
              _inputnumero(),
              Divider(),
              _inputlocalidad(),
              Divider(),
              _inputmunicipio(),
              Divider(),
              _inputestado(),
              Divider(),
              _boton()
            ],
          )),
    );
  }

  Widget _inputid() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.direccion.id.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'id',
          labelText: 'id',
          helperText: 'id',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.id = int.parse(value);
      },
    );
  }

  Widget _inputclientesId() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.direccion.clientesId.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Clientes ID',
          labelText: 'Clientes ID',
          helperText: 'Clientes ID',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.clientesId = int.parse(value);
      },
    );
  }

  Widget _inputcalle() {
    return TextFormField(
      initialValue: widget.direccion.calle,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Calle',
          labelText: 'Calle',
          helperText: 'Calle',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.calle = value;
      },
    );
  }

  Widget _inputnumero() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.direccion.numero.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Precio',
          labelText: 'Precio',
          helperText: 'Precio',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.numero = int.parse(value);
      },
    );
  }

  Widget _inputlocalidad() {
    return TextFormField(
      initialValue: widget.direccion.localidad,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Localidad',
          labelText: 'Localidad',
          helperText: 'Localidad',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.localidad = value;
      },
    );
  }

  Widget _inputmunicipio() {
    return TextFormField(
      initialValue: widget.direccion.municipio,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Municipio',
          labelText: 'Municipio',
          helperText: 'Municipio',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.municipio = value;
      },
    );
  }

  Widget _inputestado() {
    return TextFormField(
      initialValue: widget.direccion.estado,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Estado',
          labelText: 'Estado',
          helperText: 'Estado',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.direccion.estado = value;
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
    if (0 >= widget.direccion.id) {
      //crear, no existe
      print(widget.direccion.toJson());

      Dio.Response response = await dio().post('direcciones',
          data: json.encode(widget.direccion.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (201 == response.statusCode) {
        _alerta(context, 'Direccion', 'Direccion creada');
      }
    } else {
      //actualizar
      print(widget.direccion.toJson());
      Dio.Response response = await dio().put(
          'direcciones/' + widget.direccion.id.toString(),
          data: json.encode(widget.direccion.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (200 == response.statusCode) {
        _alerta(context, 'Direccion', 'Direccion actualizada');
      }
    }

    // Navigator.pop(context); //regresar a pantalla previa
    // return true;
  }
}
