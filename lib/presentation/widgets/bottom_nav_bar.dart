import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

/// Instagram-style bottom navigation bar.
/// 5 items: Home | Reels | Add | Search | Profile
/// Profile tab is selected (index 4).
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? AppColors.darkNavBarBg : AppColors.lightNavBarBg;
    final borderColor =
    isDark ? AppColors.darkNavBarBorder : AppColors.lightNavBarBorder;
    final activeColor = isDark ? AppColors.darkText : AppColors.lightText;
    const inactiveColor = AppColors.inactiveTab;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(color: borderColor, width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSizes.bottomNavHeight,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                filledIcon: Icons.home,
                index: 0,
                selectedIndex: selectedIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: onItemTapped,
              ),
              _NavItem(
                icon: Icons.play_circle_outline_rounded,
                filledIcon: Icons.play_circle_rounded,
                index: 1,
                selectedIndex: selectedIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: onItemTapped,
              ),
              _NavAddButton(
                index: 2,
                selectedIndex: selectedIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: onItemTapped,
              ),
              _NavItem(
                icon: Icons.search,
                filledIcon: Icons.search,
                index: 3,
                selectedIndex: selectedIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: onItemTapped,
              ),
              _NavProfileItem(
                index: 4,
                selectedIndex: selectedIndex,
                activeColor: activeColor,
                onTap: onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------- NAV ITEM ---
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData filledIcon;
  final int index;
  final int selectedIndex;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.filledIcon,
    required this.index,
    required this.selectedIndex,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Center(
          child: Icon(
            isSelected ? filledIcon : icon,
            size: AppSizes.bottomNavIconSize,
            color: isSelected ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------- NAV ADD BUTTON ---
class _NavAddButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  const _NavAddButton({
    required this.index,
    required this.selectedIndex,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor =
    isDark ? AppColors.darkHighlightBorder : AppColors.lightHighlightBorder;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Center(
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Icon(
              Icons.add,
              size: 20,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------- NAV PROFILE ITEM ---
class _NavProfileItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Color activeColor;
  final ValueChanged<int> onTap;

  const _NavProfileItem({
    required this.index,
    required this.selectedIndex,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Center(
          child: Container(
            width: AppSizes.bottomNavAvatarSize,
            height: AppSizes.bottomNavAvatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(
                color: activeColor,
                width: 1.5,
              )
                  : null,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.person,
                  size: 20,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.lightSecondaryText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}