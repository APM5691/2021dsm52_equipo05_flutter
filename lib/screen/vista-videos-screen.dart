import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VistaVideosScreen extends StatelessWidget {
  Future<Map<String, dynamic>> fetchUser() async {
    var response = await http.get('http://10.0.2.2:8000/api/auth/me');
    return json.decode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Center(
        child: FutureBuilder(
            future: fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Hey ${snapshot.data['name']}');
              } else {
                return Text('Hey WTF BRO??');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
