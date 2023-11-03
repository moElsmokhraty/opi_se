import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_config/api_config.dart';
import 'api_config/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );
}
