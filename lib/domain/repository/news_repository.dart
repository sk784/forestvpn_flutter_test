import 'package:forestvpn_test/data/repository.dart';

abstract class NewsRepository {
  Future<List<Article>> getLatestArticles();

  Future<List<Article>> getFeaturedArticles();

  Future<Article> getArticle(String id);
}
