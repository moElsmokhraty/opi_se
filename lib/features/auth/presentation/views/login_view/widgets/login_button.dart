import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/functions/cache_user_data.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/socket_service.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginFailure) {
          if (state.errMessage == 'please verify your account first !') {
            GoRouter.of(context).pushReplacement(
              RoutesConfig.verifyAccount,
              extra: cubit.emailController.text,
            );
          } else {
            showCustomSnackBar(context, state.errMessage);
          }
        } else if (state is LoginSuccess) {
          if (state.response.data!.getUserPrefers!) {
            GoRouter.of(context).pushReplacement(RoutesConfig.userPrefers);
          } else {
            await cacheUserData(state.response).then((value) async {
              SocketService.connect();
              await Future.delayed(const Duration(seconds: 1)).then((value) {
                showCustomSnackBar(context, 'Logged in successfully!');
                GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
              });
            });
          }
        }
      },
      listenWhen: (previous, current) {
        return current is LoginFailure || current is LoginSuccess;
      },
      buildWhen: (previous, current) {
        return current is! ChangePasswordVisibility;
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        } else {
          return AuthButton(
            text: 'Login',
            onPressed: () async {
              await cubit.login();
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
