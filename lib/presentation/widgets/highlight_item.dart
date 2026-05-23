import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../data/models/highlight_model.dart';

/// Single highlight item — circular image or "+" new button.
/// Rendered inside the horizontal highlights scroll list.
class HighlightItem extends StatelessWidget {
  final HighlightModel highlight;

  const HighlightItem({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: AppSizes.highlightItemWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          highlight.isNewButton
              ? _NewHighlightButton(isDark: isDark)
              : _HighlightCircle(
            imagePath: highlight.imagePath!,
            isDark: isDark,
          ),
          const SizedBox(height: AppSizes.xs + 2),
          _HighlightLabel(label: highlight.label, isDark: isDark),
        ],
      ),
    );
  }
}

// ------------------------------------------------------- NEW BUTTON ---
class _NewHighlightButton extends StatelessWidget {
  final bool isDark;

  const _NewHighlightButton({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.highlightImageSize,
      height: AppSizes.highlightImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark
              ? AppColors.darkHighlightBorder
              : AppColors.lightHighlightBorder,
          width: AppSizes.highlightBorderWidth,
        ),
      ),
      child: Icon(
        Icons.add,
        size: 28,
        color: isDark ? AppColors.darkText : AppColors.lightText,
      ),
    );
  }
}

// ------------------------------------------------------- HIGHLIGHT CIRCLE ---
class _HighlightCircle extends StatelessWidget {
  final String imagePath;
  final bool isDark;

  const _HighlightCircle({
    required this.imagePath,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.highlightImageSize,
      height: AppSizes.highlightImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark
              ? AppColors.darkHighlightBorder
              : AppColors.lightHighlightBorder,
          width: AppSizes.highlightBorderWidth,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _HighlightPlaceholder(isDark: isDark),
        ),
      ),
    );
  }
}

// -------------------------------------------------- PLACEHOLDER ---
class _HighlightPlaceholder extends StatelessWidget {
  final bool isDark;

  const _HighlightPlaceholder({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: Icon(
        Icons.person,
        size: 28,
        color: isDark
            ? AppColors.darkSecondaryText
            : AppColors.lightSecondaryText,
      ),
    );
  }
}

// -------------------------------------------------------- LABEL ---
class _HighlightLabel extends StatelessWidget {
  final String label;
  final bool isDark;

  const _HighlightLabel({required this.label, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isDark ? AppColors.darkText : AppColors.lightText,
        fontSize: 11.5,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}