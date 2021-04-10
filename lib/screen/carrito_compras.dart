import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/models/producto.dart';

class CarritoProductosScreen extends StatefulWidget {
  final List<Producto> _cart;

  CarritoProductosScreen(this._cart);

  @override
  CarritoProductosState createState() => CarritoProductosState(this._cart);
}

class CarritoProductosState extends State<CarritoProductosScreen> {
  double comprar = 1;

  List<Producto> _cart;
  CarritoProductosState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;

  Container pagoTotal(List<Producto> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          // Text("Total:  \$${valorTotal(_cart)}",
          //Text("Total:  ",
          Text("Total:  \$${valorTotal(_cart)}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    );
  }

  String valorTotal(List<Producto> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].precio * comprar;
    }
    return total.toStringAsFixed(2);
  }

  String tarjeta(valortotal) {
    int creditoActual = 2000;
    if (valortotal >= creditoActual) {
      return "Pago realizado con excito";
    }
    valortotal = valortotal - creditoActual;
    if (valortotal < creditoActual) {
      return "No tienes el credito suficiente";
    }

    if (creditoActual <= 0) {
      return "Error no se puede procesar el pago";
    }
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].numeroExistencias++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].numeroExistencias--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: null,
            color: Colors.white,
          )
        ],
        title: Text('Detalle',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollController
                  .jumpTo(_scrollController.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  var item = _cart[index];
                  //item.quantity = 0;
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Image.network(item.fotografia,
                                      fit: BoxFit.contain),
                                ),
                                // preguntar al profe
                                Column(
                                  children: <Widget>[
                                    Text(item.nombreProducto,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.black)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.red[600],
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Colors.blue[400],
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              )),
                                          margin: EdgeInsets.only(top: 20.0),
                                          padding: EdgeInsets.all(2.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  _removeProduct(index);
                                                  valorTotal(_cart);
                                                  // print(_cart);
                                                },
                                                color: Colors.yellow,
                                              ),
                                              Text('$comprar',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.0,
                                                      color: Colors.white)),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  _addProduct(index);
                                                  valorTotal(_cart);
                                                },
                                                color: Colors
                                                    .yellow, // print(_cart);
                                              ),
                                              // redimensionar
                                              SizedBox(
                                                height: 8.0,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 38.0,
                                ),
                                Text(item.precio.toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.purple,
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  child: Text("PAGAR"),
                  onPressed: () => {tarjeta(valorTotal(_cart))},
                  // crear un atarjeta de credito falsa en flutter credito,
                ),
              ),
            ],
          ))),
    );
  }
}
