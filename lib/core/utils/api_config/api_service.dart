import 'package:dio/dio.dart';
import '../../cache/secure_storage_helper.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? deviceToken,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    _dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      if (deviceToken != null) 'device_token': deviceToken,
    };
    var response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    _dio.options.headers = {
      if (token != null) 'Authorization': 'Bearer $token'
    };
    var response = await _dio.get(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    _dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };
    var response = await _dio.delete(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    _dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };
    var response = await _dio.put(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    _dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };
    var response = await _dio.patch(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> sendFormData({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? params,
  }) async {
    String? token = await SecureStorage.getData(key: 'token');
    final headers = {
      'Content-Type': 'multipart/form-data',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    var response = await _dio.post(
      endpoint,
      data: formData,
      queryParameters: params ?? {},
      options: Options(headers: headers),
    );
    return response.data;
  }
}
