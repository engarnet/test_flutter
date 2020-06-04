import 'package:portfolio_flutter/entity/Article.dart';
import 'package:portfolio_flutter/repository/ArticleRepository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final ArticleRepository repository;

  HomeBloc({this.repository});

  final _articleController = BehaviorSubject<List<Article>>.seeded([]);

  Stream<List<Article>> get articleStream => _articleController.stream;

  getArticles() async {
    final articles = await repository.getArticles();
    _articleController.sink.add(articles);
  }

  dispose() {
    _articleController.close();
  }
}
