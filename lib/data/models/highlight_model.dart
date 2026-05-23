/// Data model representing a single story highlight.
class HighlightModel {
  final String id;
  final String label;
  final String? imagePath; // null = show "+" new highlight button
  final bool isNewButton;

  const HighlightModel({
    required this.id,
    required this.label,
    this.imagePath,
    this.isNewButton = false,
  });
}

/// Static dummy highlight data matching the screenshots.
final List<HighlightModel> dummyHighlights = [
  const HighlightModel(
    id: 'new',
    label: 'New',
    imagePath: null,
    isNewButton: true,
  ),
  const HighlightModel(
    id: 'its_me',
    label: "It's me\u{1F642}",
    imagePath: 'assets/images/highlight_itsme.jpg',
  ),
  const HighlightModel(
    id: 'dark',
    label: 'Dark\u{1F5A4}',
    imagePath: 'assets/images/highlight_dark.jpg',
  ),
];