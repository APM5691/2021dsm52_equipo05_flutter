import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource {
  String url;
  Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  static Future load(Resource resource) async {
    var response =
        await http.get('http://192.168.0.19:8000/api/${resource.url}');
    return resource.parse(response);
  }
}
