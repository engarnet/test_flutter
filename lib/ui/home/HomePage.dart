import 'package:flutter/material.dart';
import 'package:portfolio_flutter/entity/Article.dart';
import 'package:provider/provider.dart';

import 'HomeBloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    bloc.getArticles();
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Portfolio")),
        body: StreamBuilder<List<Article>>(
            initialData: [],
            stream: bloc.articleStream,
            builder: (context, snapshot) {
              final articles = snapshot.data;

              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return ListTile(
                      leading: Image.network(article.imageUri),
                      title: Text(article.title),
                      subtitle: Text(article.author),
                    );
                  });
            }));
  }
}
