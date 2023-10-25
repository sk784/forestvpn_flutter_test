import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/utils/colors.dart';
import 'package:get_it/get_it.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = GetIt.I.get<HomeCubit>();
        cubit.getData();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, states) => states.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (data) => Scaffold(
            backgroundColor: AppColors.scaffoldBackground,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.scaffoldBackground,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () => context.read<HomeCubit>().markAllRead(),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Center(
                      child: Text(
                        'Mark all read',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: PageView(
                          children: data.featuredNews
                              .map(
                                (e) => GestureDetector(
                                  onTap: () => context
                                      .read<HomeCubit>()
                                      .goToArticle(e.id, context),
                                  child: Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(e.imageUrl),
                                          fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 40),
                                        child: Text(
                                          e.title,
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Latest news',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.latestNews.length,
                      itemBuilder: (_, i) {
                        final item = data.latestNews[i];
                        return GestureDetector(
                          onTap: () => context
                              .read<HomeCubit>()
                              .goToArticle(item.id, context),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 23),
                            decoration: BoxDecoration(
                              color: item.readed
                                  ? AppColors.readedColor
                                  : Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(item.imageUrl),
                                          fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                  ),
                                  const SizedBox(width: 23),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(item.title),
                                        Text(
                                          '${(DateTime.now().difference(item.publicationDate).inDays)}'
                                          ' day ago',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.dateColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
