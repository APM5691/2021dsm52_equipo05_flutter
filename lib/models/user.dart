import 'dart:convert';
import 'package:flutter_authentication_with_laravel_sanctum/webservice.dart';

class User {
  int id;
  String name;
  String email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  String get fulldata {
    return '${this.id} ${this.name} ${this.email}';
  }

  static Resourse get me {
    return Resourse(
        url: 'auth/me',
        parse: (reponse) {
          return User.fromJson(json.decode(reponse.body['data']));
        });
  }
}
