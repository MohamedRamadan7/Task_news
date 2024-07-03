import 'package:flutter/material.dart';

import '../../../models/article_models.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          // Replace it with CachedNetworkImage
          Expanded(
            child: articleModel.image == null
                ? const Icon(Icons.photo, size: 50)
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          articleModel.image!,
                        ),
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              articleModel.description ?? 'description',
              maxLines: 2,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
