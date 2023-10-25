import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/data/repository.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._newsRepository) : super(const HomeState.loading());

  final NewsRepository _newsRepository;

  Future getData() async {
    final featuredArticles = await _newsRepository.getFeaturedArticles();
    final latestArticles = await _newsRepository.getLatestArticles();
    emit(HomeState.success(
        featuredNews: featuredArticles, latestNews: latestArticles));
  }

  void markAllRead() {
    state.mapOrNull(
        success: (data) => emit(HomeState.success(
            featuredNews:
                data.featuredNews.map((e) => e.copyWith(readed: true)).toList(),
            latestNews: data.latestNews
                .map((e) => e.copyWith(readed: true))
                .toList())));
  }

  Future goToArticle(String id, BuildContext context) async {
    await _newsRepository.getArticle(id).then(
        (v) => Navigator.of(context).pushNamed('/article', arguments: v));
  }
}
