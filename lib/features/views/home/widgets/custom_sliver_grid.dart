import 'package:flutter/material.dart';

import '../../../models/article_models.dart';
import 'custom_item.dart';
import 'loading_indicator.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    super.key,
    required this.items,
    this.isLoding = false,
  });
  final List<ArticleModel> items;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return isLoding
        ? const SliverToBoxAdapter(child: LoadingIndicator())
        : SliverGrid.builder(
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
