import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio(BaseOptions(
      baseUrl: 'https://6038f6534e3a9b0017e94461.mockapi.io/',
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json'
      }));

  // dio
  //   ..interceptors.add(InterceptorsWrapper(
  //       onRequest: (options) => requestInterceptor(options)))//
  return dio;
}

// dynamic requestInterceptor(RequestOptions options) async {
//   if (options.headers.containsKey('auth')) {
//     var token = await Auth().getToken();

//     options.headers.addAll({'Authorization': 'Bearer $token'});
//   }
// }
