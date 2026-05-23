/// Data model representing a single post in the grid.
class PostModel {
  final String id;
  final String imagePath;
  final bool isMultiPhoto; // shows the multi-photo indicator icon
  final bool isReel;

  const PostModel({
    required this.id,
    required this.imagePath,
    this.isMultiPhoto = false,
    this.isReel = false,
  });
}

/// Static dummy post data — 9 posts matching the screenshot layout.
/// Images are placeholders; replace with real assets.
final List<PostModel> dummyPosts = [
  const PostModel(id: 'p1', imagePath: 'assets/images/post_1.jpg', isMultiPhoto: true),
  const PostModel(id: 'p2', imagePath: 'assets/images/post_2.jpg', isMultiPhoto: true),
  const PostModel(id: 'p3', imagePath: 'assets/images/post_3.jpg'),
  const PostModel(id: 'p4', imagePath: 'assets/images/post_4.jpg'),
  const PostModel(id: 'p5', imagePath: 'assets/images/post_5.jpg', isMultiPhoto: true),
  const PostModel(id: 'p6', imagePath: 'assets/images/post_6.jpg'),
  const PostModel(id: 'p7', imagePath: 'assets/images/post_7.jpg'),
  const PostModel(id: 'p8', imagePath: 'assets/images/post_8.jpg'),
  const PostModel(id: 'p9', imagePath: 'assets/images/post_9.jpg'),
];