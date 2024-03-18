import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  final Dio _dio=Dio();
  final String _baseUrl = 'https://perenual.com/api/';
  Future<Map<String, dynamic>> getData(String endPoint) async {
    Response response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
