import 'package:flutter/material.dart';
import '../../core/constants/app_sizes.dart';
import '../../data/models/post_model.dart';
import 'post_item.dart';

/// 3-column posts grid rendered as a [SliverGrid] for smooth scrolling
/// when embedded inside a [CustomScrollView].
class PostsGrid extends StatelessWidget {
  const PostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppSizes.gridCrossAxisCount,
        crossAxisSpacing: AppSizes.gridSpacing,
        mainAxisSpacing: AppSizes.gridSpacing,
        childAspectRatio: 1.0, // square posts
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) => PostItem(post: dummyPosts[index]),
        childCount: dummyPosts.length,
      ),
    );
  }
}