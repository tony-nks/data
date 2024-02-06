abstract class BlocImagesEvent {}

class BlocImagesEventInit extends BlocImagesEvent {}

class BlocImagesEventAdd extends BlocImagesEvent {
  final String url;

  BlocImagesEventAdd({
    required this.url,
  });
}

class BlocImagesEventRemove extends BlocImagesEvent {
  final String path;

  BlocImagesEventRemove({
    required this.path,
  });
}
