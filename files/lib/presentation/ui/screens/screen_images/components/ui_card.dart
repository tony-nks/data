part of '../screen_images.dart';

class _UiCard extends StatelessWidget {
  final String image;

  const _UiCard({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => context.read<BlocImages>().add(
            BlocImagesEventRemove(path: image),
          ),
      child: UiCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.file(
              File(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
