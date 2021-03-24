import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_authentication_with_laravel_sanctum/screen/producto_screen.dart';
import '../dio.dart';
import '../models/producto.dart';

class ProductosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductosState();
  }
}

class ProductosState extends State<ProductosScreen> {
  Future<List<Producto>> getProductos() async {
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
        title: Text('Productos'),
        actions: <Widget>[
          _agregaProducto(),
          _recargarProductos(),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Producto>>(
            future: getProductos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data[index];
                      // return ListTile(title: Text(item.name));
                      return ListTile(
                        title: Text(item.nombreProducto),
                        subtitle: Text(item.precio.toString()),
                        leading: Image.network(item.fotografia),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          // log('Agregar al carrito: ' + item.id.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductoScreen(producto: item)));
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Text('Falló la carga de productos');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  Widget _agregaProducto() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.orangeAccent),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          // print('agregar');
          Producto producto = Producto(

              // tipoDeJoyaId: '',
              clave: '',
              nombreProducto: '',
              numeroExistencias: 0,
              precio: 0,
              descripcion: '',
              medida: '',
              precioOferta: 0,
              fotografia: '');

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductoScreen(producto: producto)));
        },
        child: Icon(Icons.add));
  }

  Widget _recargarProductos() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.orangeAccent),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh));
  }
}
