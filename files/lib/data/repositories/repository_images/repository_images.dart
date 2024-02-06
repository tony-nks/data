abstract class RepositoryImages {
  const RepositoryImages();

  List<String> get data;

  Future<void> init();

  Future<void> add(String url);

  Future<void> remove(String path);
}
