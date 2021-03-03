import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/widgets/nav-drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'models/Article.dart';
import 'providers/auth.dart';
import 'webservice.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => Auth(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

  void _attemptAuthentication() async {
    final key = await storage.read(key: 'auth');
    Provider.of<Auth>(context, listen: false).attempt(key);
  }

  @override
  void initState() {
    _attemptAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
          child: FutureBuilder(
              future: Webservice.load(Article.all),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Article article = snapshot.data[index];

                      return ListTile(
                        title: Text(article.title),
                        subtitle: Text(article.description),
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Culd not get list of articles'),
                      RaisedButton(
                        child: Text('Tap to reply'),
                        onPressed: () => setState(() => {}),
                      )
                    ],
                  );
                }
                return CircularProgressIndicator();
              })),
    );
  }
}
