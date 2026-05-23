import 'package:flutter/material.dart';
import '../../core/constants/app_sizes.dart';
import '../../data/models/highlight_model.dart';
import 'highlight_item.dart';

/// Horizontally scrollable row of story highlights.
class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96, // image + gap + label
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.pagePaddingH,
        ),
        itemCount: dummyHighlights.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.xs),
        itemBuilder: (_, index) => HighlightItem(
          highlight: dummyHighlights[index],
        ),
      ),
    );
  }
}