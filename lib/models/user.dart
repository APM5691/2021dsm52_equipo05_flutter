import 'dart:convert';
import 'package:flutter_authentication_with_laravel_sanctum/webservice.dart';

class User {
  int id;

  String name;
  String email;
  String primerApellido;
  String segundoApellido;
  String avatar;
  String sexo;
  String edad;

  User(
      {this.id,
      this.name,
      this.email,
      this.primerApellido,
      this.segundoApellido,
      this.avatar,
      this.sexo,
      this.edad});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      primerApellido: json['primer_apellido'],
      segundoApellido: json['segundo_apellido'],
      avatar: json['avatar'],
      sexo: json['sexo'],
      edad: json['edad'],
    );
  }

  String get fulldata {
    return '${this.id} ${this.name} ${this.email} ${this.primerApellido} ${this.segundoApellido} ${this.avatar} ${this.edad}';
  }

  static Resource get me {
    return Resource(
        url: 'auth/me',
        parse: (reponse) {
          return User.fromJson(json.decode(reponse.body)['data']);
        });
  }
}
