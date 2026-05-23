import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import 'profile_stats.dart';

/// Renders the top section of the profile:
/// - Circular profile image with "+" badge
/// - Display name + pronouns
/// - Stats row (posts / followers / following)
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePaddingH),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- Profile image with "+" badge ----
          _ProfileAvatar(isDark: isDark),

          const SizedBox(width: AppSizes.lg),

          // ---- Name + pronouns + stats ----
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.sm),
                _NameRow(),
                SizedBox(height: AppSizes.sm),
                ProfileStats(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------- AVATAR ---
class _ProfileAvatar extends StatelessWidget {
  final bool isDark;

  const _ProfileAvatar({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Story ring + profile image
        Container(
          width: AppSizes.profileImageSize,
          height: AppSizes.profileImageSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // Subtle story-ring gradient like Instagram
            gradient: LinearGradient(
              colors: [
                AppColors.storyRingGradientStart,
                AppColors.storyRingGradientMid,
                AppColors.storyRingGradientEnd,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _AvatarPlaceholder(isDark: isDark),
                ),
              ),
            ),
          ),
        ),

        // "+" add story badge
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: AppSizes.plusBadgeSize,
            height: AppSizes.plusBadgeSize,
            decoration: BoxDecoration(
              color: AppColors.plusBadgeBg,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}

// --------------------------------------------------------- NAME ROW ---
class _NameRow extends StatelessWidget {
  const _NameRow();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.displayName,
          style: textTheme.titleMedium,
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          AppStrings.pronouns,
          style: textTheme.bodySmall?.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}

// --------------------------------------------------- AVATAR PLACEHOLDER ---
class _AvatarPlaceholder extends StatelessWidget {
  final bool isDark;

  const _AvatarPlaceholder({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: Icon(
        Icons.person,
        size: 40,
        color: isDark
            ? AppColors.darkSecondaryText
            : AppColors.lightSecondaryText,
      ),
    );
  }
}