import 'package:flutter/material.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';

/// Horizontal stats row: posts / followers / following.
/// Each stat is a column with a bold number and a light label.
class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatItem(count: AppStrings.postsCount, label: AppStrings.posts),
        _StatItem(count: AppStrings.followersCount, label: AppStrings.followers),
        _StatItem(count: AppStrings.followingCount, label: AppStrings.following),
      ],
    );
  }
}

// ------------------------------------------------------------- STAT ITEM ---
class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          count,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            fontSize: AppSizes.statLabelSize,
          ),
        ),
      ],
    );
  }
}