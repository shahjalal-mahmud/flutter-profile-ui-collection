import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

/// The tab bar with four tabs:
/// Grid | Reels | Collab | Tagged
///
/// State is managed locally via [ValueNotifier].
/// The parent (profile screen) passes the active tab index via [onTabChanged].
class ProfileTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = isDark ? AppColors.darkText : AppColors.lightText;
    const inactiveColor = AppColors.inactiveTab;

    return SizedBox(
      height: AppSizes.tabBarHeight,
      child: Row(
        children: [
          _TabItem(
            icon: Icons.grid_on,
            isSelected: selectedIndex == 0,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            isDark: isDark,
            onTap: () => onTabChanged(0),
          ),
          _TabItem(
            icon: Icons.play_circle_outline_rounded,
            isSelected: selectedIndex == 1,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            isDark: isDark,
            onTap: () => onTabChanged(1),
          ),
          _TabItem(
            icon: Icons.loop_rounded,
            isSelected: selectedIndex == 2,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            isDark: isDark,
            onTap: () => onTabChanged(2),
          ),
          _TabItem(
            icon: Icons.account_box_outlined,
            isSelected: selectedIndex == 3,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            isDark: isDark,
            onTap: () => onTabChanged(3),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------- TAB ITEM ---
class _TabItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;
  final bool isDark;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.inactiveColor,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  icon,
                  size: AppSizes.tabIconSize,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              ),
            ),
            // Active underline indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: AppSizes.tabIndicatorThickness,
              color: isSelected
                  ? activeColor
                  : AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}