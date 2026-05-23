import 'package:flutter/material.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';

/// Renders the profile bio text below the header.
class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePaddingH),
      child: Text(
        AppStrings.bio,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: AppSizes.bioFontSize,
          height: 1.45,
        ),
      ),
    );
  }
}