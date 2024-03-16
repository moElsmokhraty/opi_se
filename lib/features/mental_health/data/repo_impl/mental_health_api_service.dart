import 'package:dio/dio.dart';

class MentalHealthApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://mental-illness.onrender.com/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
    var response = await dio.post(
      endpoint,
      data: body,
      queryParameters: {},
    );
    return {'data': response.data};
  }
}
