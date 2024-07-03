import 'package:flutter/material.dart';

import '../../../models/article_models.dart';
import 'custom_item_2.dart';
import 'loading_indicator.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
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
        : SliverList.builder(
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
