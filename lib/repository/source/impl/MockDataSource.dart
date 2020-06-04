import 'package:portfolio_flutter/entity/Article.dart';
import 'package:portfolio_flutter/repository/source/DataSource.dart';

class MockDataSource extends DataSource {
  Future<List<Article>> getArticles() async {
    return Future.delayed(
        Duration(milliseconds: 100),
        () => List.generate(
            40,
            (index) => Article(
                title: "Title$index",
                author: "author$index",
                imageUri:
                    "https://avatars3.githubusercontent.com/u/46784189?s=60&v=4")));
  }
}
