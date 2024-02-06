import 'package:dio/dio.dart';

class ServiceHttp {
  ServiceHttp._();

  static final instance = ServiceHttp._();

  factory ServiceHttp() => instance;

  final Dio dio = Dio()
    ..options.connectTimeout = 50000
    ..options.receiveTimeout = 50000;

  Future<Response<dynamic>> getFile(String path) async => await dio.get(
        path,
        options: Options(responseType: ResponseType.bytes),
      );
}
