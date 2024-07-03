import 'package:flutter/material.dart';

import '../../../models/article_models.dart';
import 'custom_item.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
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
    return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return CustomItem(
                articleModel: items[index],
              );
            },
            itemCount: items.length,
          );
  }
}
