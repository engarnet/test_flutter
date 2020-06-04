import 'package:portfolio_flutter/entity/Article.dart';
import 'package:portfolio_flutter/repository/source/DataSource.dart';

class ArticleRepository {
  final DataSource dataSource;

  ArticleRepository({this.dataSource});

  Future<List<Article>> getArticles() async {
    return dataSource.getArticles();
  }
}
