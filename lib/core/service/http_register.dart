import 'package:dio/dio.dart';

class HttpSetup {
  final Dio _dio = Dio();

  Dio getInstance() {
    return _dio;
  }
}
