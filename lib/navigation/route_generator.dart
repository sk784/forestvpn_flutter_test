import 'package:flutter/material.dart';
import 'package:forestvpn_test/domain/model/article.dart';
import 'package:forestvpn_test/presentation/article/article_page.dart';
import 'package:forestvpn_test/presentation/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/article':
        return MaterialPageRoute(
            builder: (_) => ArticlePage(model: args as Article));
    }
    return MaterialPageRoute(builder: (_) => const SizedBox.shrink());
  }
}
