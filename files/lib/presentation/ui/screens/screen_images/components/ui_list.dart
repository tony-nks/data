part of '../screen_images.dart';

class _UiList extends StatelessWidget {
  final List<String> images;

  const _UiList({
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (_, index) => _UiCard(image: images[index]),
    );
  }
}
