import 'dart:convert';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter_authentication_with_laravel_sanctum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../dio.dart';

import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();
  bool _authenticated = false;
  User _user;
  bool get authenticated => _authenticated;
  User get user => _user;

  Future login({Map credentials}) async {
    String deviceId = await getDeviceId();
    Dio.Response response = await dio().post('auth/token',
        data: json.encode(credentials..addAll({'deviceId': deviceId})));

    String token = json.decode(response.toString())['token'];

    await attempt(token);
    storeToken(token);
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

  storeToken(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getDeviceId() async {
    String deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (e) {
      //
    }
    return deviceId;
  }

  void logout() {
    _authenticated = false;
    notifyListeners();
  }
}
