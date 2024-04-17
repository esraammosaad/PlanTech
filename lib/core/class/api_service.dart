import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  final Dio _dio=Dio();
  Future<Map<String, dynamic>> getData(String url) async {
    Response response = await _dio.get(url);
    return response.data;
  }
}
