import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';

/// Row containing "Edit profile" and "Share profile" buttons.
/// Both buttons have the same style — filled, rounded, with bold text.
class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePaddingH),
      child: Row(
        children: [
          Expanded(
            child: _ProfileButton(label: AppStrings.editProfile),
          ),
          SizedBox(width: AppSizes.sm),
          Expanded(
            child: _ProfileButton(label: AppStrings.shareProfile),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------- BUTTON ---
class _ProfileButton extends StatelessWidget {
  final String label;

  const _ProfileButton({required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor =
    isDark ? AppColors.darkButtonBg : AppColors.lightButtonBg;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;

    return GestureDetector(
      onTap: () {}, // no functionality needed
      child: Container(
        height: AppSizes.buttonHeight,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: AppSizes.buttonFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}