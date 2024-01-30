import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/domain/use_cases/get_profile_use_case.dart';
import 'api_config/api_config.dart';
import 'api_config/api_service.dart';
import '../../features/auth/data/repos_impl/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/change_password_use_case.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/home/domain/use_cases/accept_match_request_use_case.dart';
import '../../features/auth/domain/use_cases/submit_user_prefers_use_case.dart';
import '../../features/chat/data/repos_impl/chat_repo_impl.dart';
import '../../features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../features/home/data/repos_impl/match_requests_repo_impl.dart';
import '../../features/home/domain/use_cases/decline_match_request_use_case.dart';
import '../../features/home/domain/use_cases/get_match_requests_use_case.dart';
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/upload_national_id_use_case.dart';
import '../../features/auth/domain/use_cases/verify_account_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
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

  getIt.registerSingleton<UploadNationalIdUseCase>(
    UploadNationalIdUseCase(getIt.get<AuthRepoImpl>()),
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

  getIt.registerSingleton<SubmitUserPrefersUseCase>(
    SubmitUserPrefersUseCase(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ChatRepoImpl>(ChatRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<GetChatUseCase>(
    GetChatUseCase(getIt.get<ChatRepoImpl>()),
  );

  getIt.registerSingleton<MatchRequestsRepoImpl>(
    MatchRequestsRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<GetMatchRequestsUseCase>(
    GetMatchRequestsUseCase(getIt.get<MatchRequestsRepoImpl>()),
  );

  getIt.registerSingleton<DeclineMatchRequestUseCase>(
    DeclineMatchRequestUseCase(getIt.get<MatchRequestsRepoImpl>()),
  );

  getIt.registerSingleton<AcceptMatchRequestsUseCase>(
    AcceptMatchRequestsUseCase(getIt.get<MatchRequestsRepoImpl>()),
  );

  getIt.registerSingleton<GetProfileUseCase>(
    GetProfileUseCase(getIt.get<MatchRequestsRepoImpl>()),
  );
}
