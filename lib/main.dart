import 'package:flutter/material.dart';
import 'package:portfolio_flutter/repository/ArticleRepository.dart';
import 'package:portfolio_flutter/repository/source/impl/MockDataSource.dart';
import 'package:portfolio_flutter/ui/home/HomeBloc.dart';
import 'package:portfolio_flutter/ui/home/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ArticleRepository _articleRepository =
      ArticleRepository(dataSource: MockDataSource());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MultiProvider(providers: [
              Provider<HomeBloc>(
                create: (context) => HomeBloc(repository: _articleRepository),
                dispose: (context, bloc) => bloc.dispose(),
              )
            ], child: HomePage()),
      },
    );
  }
}
