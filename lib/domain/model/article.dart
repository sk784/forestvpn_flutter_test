import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/article.f.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required DateTime publicationDate,
    required String imageUrl,
    @Default(false) bool readed,
    required String? description
}) = _Article;
}

