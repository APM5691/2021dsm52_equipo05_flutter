import 'dart:convert';
import 'package:flutter_authentication_with_laravel_sanctum/webservice.dart';

class User {
  int id;
  String name;
  String email;
  String primerApellido;
  String segundoApellido;
  String fotografia;
  String sexo;

  String fechaNacimiento;
  String perfil;
  String estatus;
  String password;

  User(
      {this.id,
      this.name,
      this.email,
      this.primerApellido,
      this.segundoApellido,
      this.fotografia,
      this.sexo,
      this.fechaNacimiento,
      this.perfil,
      this.estatus,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      primerApellido: json['primer_apellido'],
      segundoApellido: json['segundo_apellido'],
      fotografia: json['fotografia'],
      sexo: json['sexo'],
      fechaNacimiento: json['fecha_nacimiento'],
      perfil: json['perfil'],
      estatus: json['estatus'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "primer_apellido": primerApellido,
      "segundo_apellido": segundoApellido,
      "fotografia": fotografia,
      "sexo": sexo,
      "fecha_nacimiento": fechaNacimiento,
      "perfil": perfil,
      "estatus": estatus,
      "password": password,
    };
  }

  String get fulldata {
    return '${this.id} ${this.name} ${this.email} ${this.fotografia} ${this.primerApellido} ${this.segundoApellido} ';
  }

  static Resource get me {
    return Resource(
        url: 'auth/me',
        parse: (reponse) {
          return User.fromJson(json.decode(reponse.body)['data']);
        });
  }
}
