import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/1/",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );

  Future<Response?> getRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      print("GET request error: $e");
      return null;
    }
  }

  Future<Response?> postRequest(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print("POST request error: $e");
      return null;
    }
  }

  Future<Response?> putRequest(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      print("PUT request error: $e");
      return null;
    }
  }

  Future<Response?> deleteRequest(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      print("DELETE request error: $e");
      return null;
    }
  }
}
