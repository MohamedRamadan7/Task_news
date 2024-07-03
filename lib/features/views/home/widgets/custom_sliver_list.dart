import 'package:flutter/material.dart';

import '../../../models/article_models.dart';
import 'custom_item_2.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    super.key,
  });
  static List<ArticleModel> items = [
    ArticleModel(
      title: 'title',
      image: 'https://cdn.arstechnica.net/wp-content/uploads/2013/09/IDI_014-640x215.jpg',
      description: 'description',
      data: 'data',
    ),
        ArticleModel(
      title: 'title',
      image: 'https://cdn.arstechnica.net/wp-content/uploads/2013/09/IDI_014-640x215.jpg',
      description: 'description',
      data: 'data',
    ),    ArticleModel(
      title: 'title',
      image: 'https://cdn.arstechnica.net/wp-content/uploads/2013/09/IDI_014-640x215.jpg',
      description: 'description',
      data: 'data',
    ),    ArticleModel(
      title: 'title',
      image: 'https://cdn.arstechnica.net/wp-content/uploads/2013/09/IDI_014-640x215.jpg',
      description: 'description',
      data: 'data',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomItem2(articleModel: items[index]),
        );
      },
      itemCount: items.length,
    );
  }
}
