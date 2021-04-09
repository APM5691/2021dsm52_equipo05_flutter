import 'package:dio/dio.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';

Dio dio() {
  var dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.0.19:8000/api/',
      // cambiar para telefono fisico o virtual
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json'
      }));

  dio
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (options) => requestInterceptor(options)));
  return dio;
}

dynamic requestInterceptor(RequestOptions options) async {
  if (options.headers.containsKey('auth')) {
    var token = await Auth().getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
  }
}
