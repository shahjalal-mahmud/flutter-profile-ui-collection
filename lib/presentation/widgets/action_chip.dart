import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

/// Reusable chip used in the action chips row (Threads, Facebook, Add).
/// Renders a bordered chip with an optional leading icon widget.
class ProfileActionChip extends StatelessWidget {
  final String label;
  final Widget? leadingIcon;

  const ProfileActionChip({
    super.key,
    required this.label,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor =
    isDark ? AppColors.darkChipBg : AppColors.lightChipBg;
    final borderColor =
    isDark ? AppColors.darkChipBorder : AppColors.lightChipBorder;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;

    return Container(
      height: AppSizes.chipHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSizes.chipRadius),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: AppSizes.chipFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Row of action chips: Threads chip, Facebook chip, Add chip.
class ActionChipsRow extends StatelessWidget {
  const ActionChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? AppColors.darkText : AppColors.lightText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePaddingH),
      child: Row(
        children: [
          // Threads chip
          ProfileActionChip(
            label: 'shahjalal_mahmud',
            leadingIcon: _ThreadsIcon(color: iconColor),
          ),

          const SizedBox(width: AppSizes.sm),

          // Facebook chip
          ProfileActionChip(
            label: 'Shahjalal Mahmud',
            leadingIcon: _FacebookIcon(color: iconColor),
          ),

          const SizedBox(width: AppSizes.sm),

          // "+ Add" chip (no icon)
          const ProfileActionChip(label: '+ Add'),
        ],
      ),
    );
  }
}

// ----------------------------------------------------- CUSTOM ICON WIDGETS --

/// Threads logo icon rendered as a custom painter.
class _ThreadsIcon extends StatelessWidget {
  final Color color;

  const _ThreadsIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.api_rounded, size: 13, color: color);
  }
}

/// Facebook logo icon — using a styled "f" text.
class _FacebookIcon extends StatelessWidget {
  final Color color;

  const _FacebookIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: const Color(0xFF1877F2),
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Center(
        child: Text(
          'f',
          style: TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
      ),
    );
  }
}