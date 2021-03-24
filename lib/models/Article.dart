import 'package:flutter_authentication_with_laravel_sanctum/webservice.dart';

class Article {
  int id;
  String title;
  String description;

  Article({this.id, this.title, this.description});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  static Resource get all {
    return Resource(
        url: 'articles',
        parse: (reponse) {
          // Iterable list = json.decode(reponse.body)['data'];

          //  return list.map(article) {
          //    return Article.fromJson(
          //      article
          //    );
          //  }
          //  .toList();
        });
  }
}
