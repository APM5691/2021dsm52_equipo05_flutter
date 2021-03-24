import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;

import '../dio.dart';
import '../models/producto.dart';

class ProductoScreen extends StatefulWidget {
  final Producto producto;

  ProductoScreen({Key key, this.producto}) : super(key: key);

  @override
  _ProductoScreenState createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Crear ' + 'Editar ') + 'producto')),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _inputclave(),
              Divider(),
              _inputnombreProducto(),
              Divider(),
              _inputnumeroExistencias(),
              Divider(),
              _inputprecio(),
              Divider(),
              _inputdescripcion(),
              Divider(),
              _inputmedida(),
              Divider(),
              _inputprecioOferta(),
              Divider(),
              _inputfotografia(),
              Divider(),
              _boton()
            ],
          )),
    );
  }

  Widget _inputclave() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.producto.clave,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Clave',
          labelText: 'Clave',
          helperText: 'Clave',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.clave = value;
      },
    );
  }

  Widget _inputnombreProducto() {
    return TextFormField(
      // autofocus: true,
      initialValue: widget.producto.nombreProducto,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del producto',
          labelText: 'Nombre del producto',
          helperText: 'Nombre del producto',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.nombreProducto = value;
      },
    );
  }

  Widget _inputnumeroExistencias() {
    return TextFormField(
      keyboardType: TextInputType.number,
      // autofocus: true,
      initialValue: widget.producto.numeroExistencias.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero de existencias',
          labelText: 'Numero de existencias',
          helperText: 'Numero de existencias',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.numeroExistencias = int.parse(value);
      },
    );
  }

  Widget _inputprecio() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.producto.precio.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Precio',
          labelText: 'Precio',
          helperText: 'Precio',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.precio = int.parse(value);
      },
    );
  }

  Widget _inputdescripcion() {
    return TextFormField(
      initialValue: widget.producto.descripcion,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Descripción',
          labelText: 'Descripción',
          helperText: 'Descripción',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.descripcion = value;
      },
    );
  }

  Widget _inputmedida() {
    return TextFormField(
      initialValue: widget.producto.medida,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Medida',
          labelText: 'Medida',
          helperText: 'Medida',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.medida = value;
      },
    );
  }

  Widget _inputprecioOferta() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: widget.producto.precioOferta.toString(),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Precio de oferta',
          labelText: 'Precio de oferta',
          helperText: 'Precio de oferta',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.precioOferta = int.parse(value);
      },
    );
  }

  Widget _inputfotografia() {
    return TextFormField(
      initialValue: widget.producto.fotografia,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fotografia',
          labelText: 'Fotografia',
          helperText: 'Fotografia',
          suffixIcon: Icon(Icons.keyboard),
          icon: Icon(Icons.keyboard)),
      onChanged: (value) {
        widget.producto.fotografia = value;
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
    if (0 >= widget.producto.id) {
      //crear, no existe
      print(widget.producto.toJson());

      Dio.Response response = await dio().post('productos',
          data: json.encode(widget.producto.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (201 == response.statusCode) {
        _alerta(context, 'Producto', 'Producto creado');
      }
    } else {
      //actualizar
      print(widget.producto.toJson());
      Dio.Response response = await dio().put(
          'productos/' + widget.producto.id.toString(),
          data: json.encode(widget.producto.toJson()),
          options: Dio.Options(headers: {'auth': true}));

      if (200 == response.statusCode) {
        _alerta(context, 'Producto', 'Producto actualizado');
      }
    }

    // Navigator.pop(context); //regresar a pantalla previa
    // return true;
  }
}
