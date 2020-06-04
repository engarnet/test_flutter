import 'package:portfolio_flutter/entity/Article.dart';

abstract class DataSource {
  Future<List<Article>> getArticles();
}
