import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/v2/"));
  }

  static Future<Response?> getData(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio?.get(path, queryParameters: queryParameters);
  }
}
