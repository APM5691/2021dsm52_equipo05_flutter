import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/carrito_compras.dart';

Widget appbar(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        tooltip: 'Go to the next page',
      ),
    ],
  );
}