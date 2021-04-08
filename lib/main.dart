import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/widgets/app-bar.dart';
import 'package:flutter_authentication_with_laravel_sanctum/widgets/nav-drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => Auth(), child: MyApp()));
  // cambiar esta linea traspasar contenido de hmescreen desde login mx a main
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joyeria Luminosete',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Autenticacion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = new FlutterSecureStorage();

  final Set carrito = {'id', 'precio'};

  void _attemptAuthentication() async {
    final key = await storage.read(key: 'auth');
    Provider.of<Auth>(context, listen: false).attempt(key);
  }

  @override
  void initState() {
    _attemptAuthentication();
    super.initState();
  }

  int _current = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final List<String> imgList = [
      'https://img.freepik.com/foto-gratis/parure-joyas-piedras-preciosas_126745-644.jpg?size=626&ext=jpg',
      'https://voydecompras.cl/wp-content/uploads/2017/04/Las-joyas-que-venden-en-Aliexpress-eBay-y-Wish-son-de-plata.jpg',
      'https://deplatay.es/wp-content/uploads/2016/08/pendientes-swarovski-elements-en-tonos-azules.jpg',
      'https://silviagacu.com/wp-content/uploads/2017/06/Pendientes-Swarovski_Azul.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX76oDqQ8gywL2KI_2ILRdEccT-iTLA56bU0pq6WauTCNQfjNGBIFFXKH8uk_bmtb6i4E&usqp=CAU',
      'https://www.joyeriacuevasamoros.com/images/1528108688-producto-0',
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item) + 1} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
            // como poner todo este appbar en todas las paginas
            // como hacer un carrito de compras
            appBar: appbar(context, 'Pagina principal', {'icons': Icons.menu}),
            drawer: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: Colors.yellowAccent[50]),
                child: NavDrawer()),
            body:
                // SingleChildScrollView(
                //     child: ConstrainedBox(
                //         constraints: BoxConstraints(
                //           minHeight: 0.0,
                //         ),child:
                // Column(
                ListView(padding: const EdgeInsets.all(8), children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Center(
                          child: Text(
                        'Joyeria Luminosete',
                        style: TextStyle(
                          height: 2,
                          fontSize: 25,
                        ),
                      )))),
              Column(children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ]),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Center(
                          child: Text('El lujo no debe salir caro',
                              style: TextStyle(
                                height: 2,
                                fontSize: 20,
                              ))))),
              Divider(),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Center(
                          child: Text('ANTECEDENTES DE LA ORGANIZACIÓN')))),
              Divider(),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Center(
                          child: Text(
                              'Joyería Luminosité es una empresa orgullosamente mexicana , establecida en el año 2020 ubicada en Toluca con presencia en el centro de toluca, a un lado de la plaza de los mártires. Esta empresa fue creada por 3 estudiantes apasionados por el mundo de digital para facilitar la búsqueda de joyas al mejor precio, pero manteniendo la mejor calidad posible, a su disposición. Nos enfocamos en la venta de joyeria de segunda mano, no incluyendo los aspectos de distribución y entrega de los productos, directamente la empresa no proporciona estos servicios pero contando con terceros para la distribución.',
                              style: TextStyle(
                                height: 2,
                                fontSize: 20,
                              ))))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child:
                          Center(child: Text('El lujo no debe salir caro')))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child:
                          Center(child: Text('El lujo no debe salir caro')))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child:
                          Center(child: Text('El lujo no debe salir caro')))),
            ]))
        // ))
        ;
  }
}

//  foreground: Paint()
//                   ..style = PaintingStyle.stroke
//                   ..strokeWidth = 2
//                   ..color = Colors.red

// Scaffold(
//   appBar: AppBar(
//     title: Text(widget.title),
//   ),
//   drawer: NavDrawer(),
//   body: Center(
//       child: FutureBuilder(
//           future: Webservice.load(Article.all),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   Article article = snapshot.data[index];

//                   return ListTile(
//                     title: Text(article.title),
//                     subtitle: Text(article.description),
//                   );
//                 },
//               );
//             }
//             if (snapshot.hasError) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Culd not get list of articles'),
//                   RaisedButton(
//                     child: Text('Tap to reply'),
//                     onPressed: () => setState(() => {}),
//                   )
//                 ],
//               );
//             }
//             return CircularProgressIndicator();
//           })),
// );
