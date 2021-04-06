import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/producto.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/carrito_compras.dart';

Widget appbar(BuildContext context, String title, dynamic otherData) {
  List<Producto> _listaCarro = List<Producto>();
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 8.0),
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 38,
              ),
              if (_listaCarro.length > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Text(
                      _listaCarro.length.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                  ),
                ),
            ],
          ),
          onTap: () {
            if (_listaCarro.isNotEmpty)
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CarritoProductosScreen(_listaCarro),
                ),
              );
          },
        ),
      )
    ],
  );
}
