import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/screen/carrito_compras.dart';
import '../dio.dart';
import '../models/producto.dart';

class CatalogoProductosScreen extends StatefulWidget {
  CatalogoProductosScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CatalogoProductosState();
  }
}

class CatalogoProductosState extends State<CatalogoProductosScreen> {
  List<Producto> _listaCarro = List<Producto>();
  Future<List<Producto>> getCatalogoProductos() async {
    Dio.Response response = await dio()
        .get('productos', options: Dio.Options(headers: {'auth': true}));
    // print(response.data.toString());
    List posts = json.decode(response.toString())['data'];
    return posts.map((post) => Producto.fromJson(post)).toList();
  }

  List<bool> addFavorite = List<bool>();

  Icon firstIcon = Icon(
    Icons.shopping_cart,
    color: Colors.green,
    size: 38,
  );
  Icon secondIcon = Icon(
    Icons.shopping_cart,
    color: Colors.red,
    size: 38,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalogo de Productos"),
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
                        builder: (context) =>
                            CarritoProductosScreen(_listaCarro),
                      ),
                    );
                },
              ),
            )
          ],
        ),
        body: Center(
            child: FutureBuilder<List<Producto>>(
                future: getCatalogoProductos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        padding: const EdgeInsets.all(4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          addFavorite.add(false);
                          var item = snapshot.data[index];
                          return Card(
                              elevation: 4.0,
                              child: Stack(
                                fit: StackFit.loose,
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Image.network(item.fotografia),
                                      ),
                                      // ver por que no funciona
                                      Text(
                                        item.nombreProducto,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            item.precio.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0,
                                                color: Colors.black),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8.0,
                                              bottom: 8.0,
                                            ),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: IconButton(
                                                  icon: Icon(addFavorite
                                                          .elementAt(index)
                                                      ? Icons.favorite
                                                      : Icons.favorite_border),
                                                  onPressed: () {
                                                    // Setting the state
                                                    setState(() {
                                                      // Changing icon of specific index
                                                      addFavorite[index] =
                                                          addFavorite[index] ==
                                                                  false
                                                              ? true
                                                              : false;
                                                      if (_listaCarro
                                                          .contains(item))
                                                        _listaCarro
                                                            .remove(item);
                                                      else
                                                        _listaCarro.add(item);
                                                    });
                                                  }),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ));
                        });
                  }
                })));
  }
}
