import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forestvpn_test/domain/model/article.dart';
import 'package:forestvpn_test/utils/colors.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Article model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          expandedHeight: 414,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(12)),
                image: DecorationImage(
                    image: NetworkImage(model.imageUrl), fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(48, 0, 96, 40),
                  child: Text(
                    model.title,
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
    SliverList(
    delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          model.description ?? '',
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),

      ]),
    )]
    )
    );
  }
}
