import 'package:forestvpn_test/domain/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/home_state.f.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = Loading;

  const factory HomeState.success({
  @Default([]) List<Article> featuredNews,
  @Default([]) List<Article> latestNews,
}) = Success;
}