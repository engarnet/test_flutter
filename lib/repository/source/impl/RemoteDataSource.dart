import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:portfolio_flutter/entity/Article.dart';
import 'package:portfolio_flutter/repository/source/DataSource.dart';

class RemoteDataSource extends DataSource {
  Future<List<Article>> getArticles() async {
    final baseUrl = 'https://qiita.com/api/v2/items';
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return response.toArticle();
    } else {
      throw StateError("status code is not 200");
    }
  }
}

extension QiitaResponse on Response {
  List<Article> toArticle() {
    final List articles = json.decode(body);
    return articles
        .map((article) => Article(
            title: article["title"],
            author: article["user"]["name"],
            imageUri: article["user"]["profile_image_url"]))
        .toList();
  }
}
