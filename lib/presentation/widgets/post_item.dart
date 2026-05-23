import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/post_model.dart';

/// Single post tile used in the 3-column posts grid.
/// Shows image and an optional indicator icon (multi-photo or reel).
class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Post image
        Image.asset(
          post.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _PostPlaceholder(isDark: isDark),
        ),

        // Multi-photo or reel indicator icon (top-right)
        if (post.isMultiPhoto || post.isReel)
          Positioned(
            top: 6,
            right: 6,
            child: _PostIndicatorIcon(isReel: post.isReel),
          ),
      ],
    );
  }
}

// --------------------------------------------------------- INDICATOR ICON ---
class _PostIndicatorIcon extends StatelessWidget {
  final bool isReel;

  const _PostIndicatorIcon({required this.isReel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        isReel
            ? Icons.play_circle_outline
            : Icons.collections_outlined,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}

// -------------------------------------------------------- PLACEHOLDER ---
class _PostPlaceholder extends StatelessWidget {
  final bool isDark;

  const _PostPlaceholder({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? AppColors.darkSurface : const Color(0xFFE0E0E0),
      child: Icon(
        Icons.image_outlined,
        color: isDark
            ? AppColors.darkSecondaryText
            : AppColors.lightSecondaryText,
        size: 28,
      ),
    );
  }
}