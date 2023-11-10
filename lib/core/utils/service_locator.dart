import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:opi_se/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/verify_account_use_case.dart';
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
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ChangePasswordUseCase>(
    ChangePasswordUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ForgotPasswordUseCase>(
    ForgotPasswordUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<VerifyAccountUseCase>(
    VerifyAccountUseCase(getIt.get<AuthRepoImpl>()),
  );
}
