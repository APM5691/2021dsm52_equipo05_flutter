import 'dart:convert';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter_authentication_with_laravel_sanctum/models/user.dart';
import '../dio.dart';

import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _authenticated = false;
  User _user;
  bool get authenticated => _authenticated;
  User get user => _user;

  Future login({Map credentials}) async {
    Dio.Response response =
        await dio().post('auth/token', data: json.encode(credentials));

    String token = json.decode(response.toString())['token'];

    await attempt(token);
  }

  Future attempt(String token) async {
    try {
      Dio.Response response = await dio().get('auth/user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
      _user = User.fromJson(json.decode(response.toString()));
      _authenticated = true;
    } catch (e) {
      _authenticated = false;
    }
    notifyListeners();
  }

  void logout() {
    _authenticated = false;
    notifyListeners();
  }
}
