import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/login_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:opi_se/features/auth/presentation/cubits/questions_cubit/questions_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/auth_options_view/auth_options_view.dart';
import 'package:opi_se/features/auth/presentation/views/change_password_views/change_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/forgot_password_view/forget_password_view.dart';
import 'package:opi_se/features/auth/presentation/views/login_view/login_view.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/questions_view.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/first_register_view.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/map_view.dart';
import 'package:opi_se/features/auth/presentation/views/verify_account_view/verify_account_view.dart';
import 'package:opi_se/features/settings/presentation/views/edit_profile_view/edit_profile_view.dart';
import '../../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../../features/auth/domain/use_cases/verify_account_use_case.dart';
import '../../../features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/auth/presentation/cubits/verify_account_cubit/verify_account_cubit.dart';
import '../../../features/auth/presentation/views/change_password_views/successful_change_view.dart';
import '../../../features/auth/presentation/views/register_views/second_register_view.dart';
import '../../../features/auth/presentation/views/register_views/third_register_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesConfig.questions,
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
        path: RoutesConfig.firstRegister,
        builder: (context, state) {
          return const FirstRegisterView();
        },
      ),
      GoRoute(
        path: RoutesConfig.secondRegister,
        builder: (context, state) {
          return const SecondRegisterView();
        },
      ),
      GoRoute(
        path: RoutesConfig.thirdRegister,
        builder: (context, state) {
          return const ThirdRegisterView();
        },
      ),
      GoRoute(
        path: RoutesConfig.map,
        builder: (context, state) {
          return const MapView();
        },
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
      ),
      GoRoute(
        path: RoutesConfig.verifyAccount,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => VerifyAccountCubit(
              getIt.get<VerifyAccountUseCase>(),
            ),
            child: VerifyAccountView(email: state.extra as String),
          );
        },
      ),
      GoRoute(
        path: RoutesConfig.questions,
        builder: (context, state) => BlocProvider(
          create: (context) => QuestionsCubit(),
          child: const QuestionsView(),
        ),
      ),
      GoRoute(
        path: RoutesConfig.editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
    ],
  );
}
