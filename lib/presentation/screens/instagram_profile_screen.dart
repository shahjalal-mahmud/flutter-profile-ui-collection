import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../widgets/action_chip.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/highlights_section.dart';
import '../widgets/posts_grid.dart';
import '../widgets/profile_bio.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tabs.dart';

/// Main Instagram profile screen.
///
/// Uses [CustomScrollView] + slivers so the entire page
/// (header, highlights, tabs, grid) scrolls together smoothly.
/// Local state is managed with [StatefulWidget] — no external packages needed.
class InstagramProfileScreen extends StatefulWidget {
  const InstagramProfileScreen({super.key});

  @override
  State<InstagramProfileScreen> createState() => _InstagramProfileScreenState();
}

class _InstagramProfileScreenState extends State<InstagramProfileScreen> {
  int _selectedTab = 0;
  int _selectedNavIndex = 4; // profile tab selected by default

  void _onTabChanged(int index) => setState(() => _selectedTab = index);
  void _onNavChanged(int index) => setState(() => _selectedNavIndex = index);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ---- App Bar ----
          _buildAppBar(isDark),

          // ---- Profile body ----
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.md),

                // Profile image + stats
                const ProfileHeader(),

                const SizedBox(height: AppSizes.md),

                // Bio
                const ProfileBio(),

                const SizedBox(height: AppSizes.sm + 2),

                // Action chips
                const ActionChipsRow(),

                const SizedBox(height: AppSizes.sm + 2),

                // Edit / Share buttons
                const ProfileButtons(),

                const SizedBox(height: AppSizes.lg),

                // Story highlights
                const HighlightsSection(),

                const SizedBox(height: AppSizes.xs),

                // Divider
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: isDark
                      ? AppColors.darkDivider
                      : AppColors.lightDivider,
                ),

                // Tab bar
                ProfileTabs(
                  selectedIndex: _selectedTab,
                  onTabChanged: _onTabChanged,
                ),

                // Thin divider below tab bar
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: isDark
                      ? AppColors.darkDivider
                      : AppColors.lightDivider,
                ),
              ],
            ),
          ),

          // ---- Posts grid ----
          const PostsGrid(),

          // ---- Bottom spacing so last row isn't hidden ----
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),

      // ---- Bottom navigation ----
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedNavIndex,
        onItemTapped: _onNavChanged,
      ),
    );
  }

  // ---------------------------------------------------------------- APP BAR --
  SliverAppBar _buildAppBar(bool isDark) {
    final iconColor = isDark ? AppColors.darkIconColor : AppColors.lightIconColor;
    final bgColor =
    isDark ? AppColors.darkBackground : AppColors.lightBackground;

    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      backgroundColor: bgColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSizes.sm),
        child: IconButton(
          icon: Icon(Icons.add, color: iconColor, size: AppSizes.appBarIconSize),
          onPressed: () {},
          tooltip: 'New',
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_outline, size: 14, color: iconColor),
          const SizedBox(width: 4),
          Text(
            AppStrings.appBarTitle,
            style: TextStyle(
              color: iconColor,
              fontSize: AppSizes.appBarFontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(width: 2),
          Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: iconColor),
        ],
      ),
      centerTitle: true,
      actions: [
        // Threads icon
        IconButton(
          icon: Icon(Icons.api_rounded, color: iconColor, size: AppSizes.appBarIconSize),
          onPressed: () {},
          tooltip: 'Threads',
        ),
        // Menu icon
        IconButton(
          icon: Icon(Icons.menu, color: iconColor, size: AppSizes.appBarIconSize),
          onPressed: () {},
          tooltip: 'Menu',
          padding: const EdgeInsets.only(right: AppSizes.xs),
        ),
      ],
    );
  }
}