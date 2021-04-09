import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';


import '../dio.dart';
import '../models/venta.dart';

class VentaScreen extends StatefulWidget {
  final Venta venta;

  VentaScreen({Key key, this.venta}) : super(key: key);

  @override
  _VentaScreenState createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Crear ' + 'Editar ') + 'Ventas')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _inputid(),
              Divider(),
              _inputmonto_total(),
              Divider(),
              _inputdirecciones_id(),
              Divider(),
               _inputclientes_id(),
              Divider(),
              
              _boton()
            ],
          )),
    );
  }

  Widget _inputid() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.venta.id.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'id',
          labelText: 'id',
          helperText: 'id',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.venta.id = int.parse(value);
      },
    );
  }

  Widget _inputmonto_total() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.venta.id.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Monto Total',
          labelText: 'Monto Total',
          helperText: 'Monto Total',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.venta.montoTotal = int.parse(value);
      },
    );
  }
  Widget _inputdirecciones_id() {
     return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.venta.id.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Direcciones Id',
          labelText: 'Direcciones Id',
          helperText: 'Direcciones Id',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.venta.direccionesId = int.parse(value);
      },
    );
  }
Widget _inputclientes_id() {
   return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.venta.id.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Clientes Id',
          labelText: 'Clientes Id',
          helperText: 'Clientes Id',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.venta.clientesId = int.parse(value);
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
    if (0 >= widget.venta.id) {
      //crear, no existe
      print(widget.venta.toJson());

      Dio.Response response = await dio().post('materiales',
          data: json.encode(widget.venta.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (201 == response.statusCode) {
        _alerta(context, 'Venta', 'Venta creada');
      }
    } else {
      //actualizar
      print(widget.venta.toJson());
      Dio.Response response = await dio().put(
          'materiales/' + widget.venta.id.toString(),
          data: json.encode(widget.venta.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (200 == response.statusCode) {
        _alerta(context, 'Venta', 'Ventas actualizadas');
      }
    }

    // Navigator.pop(context); //regresar a pantalla previa
    // return true;
  }
}

