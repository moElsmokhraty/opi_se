import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/login_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/auth_options_view/auth_options_view.dart';
import 'package:opi_se/features/auth/presentation/views/change_password_view/change_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/forgot_password_view/forget_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/login_view/login_view.dart';
import '../../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../../features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/auth/presentation/views/change_password_view/successful_change_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesConfig.successfulChange,
    routes: [
      GoRoute(
        path: RoutesConfig.authOptions,
        builder: (context, state) => const AuthOptionsView(),
      ),
      GoRoute(
        path: RoutesConfig.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.changePassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(
            getIt.get<ChangePasswordUseCase>(),
          ),
          child: const ChangePasswordView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.successfulChange,
        builder: (context, state) {
          return const SuccessfulChangeView();
        },
      ),
      GoRoute(
        path: RoutesConfig.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(
            getIt.get<ForgotPasswordUseCase>(),
          ),
          child: const ForgotPasswordView(),
        ),
      )
    ],
  );
}
