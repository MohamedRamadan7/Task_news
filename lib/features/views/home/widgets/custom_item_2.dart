import 'package:flutter/material.dart';

import '../../../models/article_models.dart';

class CustomItem2 extends StatelessWidget {
  const CustomItem2({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        articleModel.image!,
                      ),
                    ),
                  ),
                ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          articleModel.title ?? 'title',
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        articleModel.data ?? 'date',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    articleModel.description ?? 'description',
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
