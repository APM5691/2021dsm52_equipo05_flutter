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
  List<Producto> _listaCarro;
  Future<List<Producto>> getCatalogoProductos() async {
    Dio.Response response = await dio()
        .get('productos', options: Dio.Options(headers: {'auth': true}));
    // print(response.data.toString());
    List posts = json.decode(response.toString())['data'];
    return posts.map((post) => Producto.fromJson(post)).toList();
  }

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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index];
                          return Card(
                              elevation: 4.0,
                              child: Stack(
                                fit: StackFit.loose,
                                alignment: Alignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: Expanded(
                                        child: Image.network(item.fotografia)),
                                    subtitle: Expanded(
                                        child: Text(item.precio.toString())),
                                    leading: Expanded(
                                        child: Text(item.nombreProducto)),
                                  )
                                ],
                              ));
                        });
                  }
                })));
  }
}

//         padding: EdgeInsets.all(8.0),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20),
//         itemCount: snapshot.data.length,
//         itemBuilder: (context, index) {
//           var item = snapshot.data[index];
//           // return ListTile(title: Text(item.name));
//           return Container(
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(15)),
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                       child: Container(
//                           child: Column(children: <Widget>[
//                     Expanded(child: Image.network(item.fotografia)),
//                     Text(item.precio.toString()),
//                     Text(item.nombreProducto),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(
//                                 Colors.red[200]),
//                       ),
//                       child: Text('Detalles'),
//                       onPressed: () => {},
//                     ),
//                     ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all<Color>(
//                                   Colors.red[700]),
//                         ),
//                         child:
//                             Text('Agregar al carrito de compras'),
//                         onPressed: () {
//                           // log(widget.carrito.toString());
//                           // widget.carrito.add(item.id.toString());
//                           // widget.carrito.add(item.precioOferta),
//                           // widget.carrito.add(item.fotografia),
//                           // MaterialPageRoute(
//                           //     builder: (context) =>
//                           //         CarritoProductosScreen(
//                           //           carrito: widget.carrito,
//                           //         ));
//                           log('añadido al carrito');
//                         })
//                   ])))
//                 ],
//               ));
//         });
//   } else if (snapshot.hasError) {
//     log(snapshot.error.toString());
//     return Text('Falló la carga de productos');
//   }
//   return CircularProgressIndicator();
// }),
