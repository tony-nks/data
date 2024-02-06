import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:app_files/data/repositories/repository_images/repository_images.dart';
import 'package:app_files/data/services/service_http.dart';

const String _directoryImages = 'images';

class RepositoryImagesImp extends RepositoryImages {
  RepositoryImagesImp();

  late Directory _directory;

  @override
  List<String> get data =>
      _directory.listSync().map((image) => image.path).toList();

  @override
  Future<void> init() async {
    await _getDirectory();
  }

  @override
  Future<void> add(String url) async {
    final response = await ServiceHttp.instance.getFile(url);

    if (response.statusCode == 200) {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = '${_directory.path}$timestamp${url.split('.').last}';

      Uint8List uint8list = response.data;
      ByteBuffer buffer = uint8list.buffer;
      ByteData byteData = ByteData.view(uint8list.buffer);

      final file = File(filename);

      await file.create();

      await file.writeAsBytes(buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ));
    }
  }

  @override
  Future<void> remove(String path) async {
    await File(path).delete();
  }

  Future<void> _getDirectory() async {
    final directoryApp = await getApplicationDocumentsDirectory();

    _directory = Directory('${directoryApp.path}/$_directoryImages/');

    if (!await _directory.exists()) {
      await _directory.create(recursive: true);
    }
  }
}
