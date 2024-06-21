import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/mentor_login_cubit/mentor_login_cubit.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class MentorLoginButton extends StatelessWidget {
  const MentorLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final MentorLoginCubit cubit = BlocProvider.of<MentorLoginCubit>(context);
    return BlocConsumer<MentorLoginCubit, MentorLoginState>(
      listener: (context, state) async {
        if (state is LoginFailure) {
          if (state.errMessage == 'please verify your account first !') {
            GoRouter.of(context).pushReplacement(
              RoutesConfig.mentorLoginOtp,
              extra: cubit.emailController.text,
            );
          } else {
            showCustomSnackBar(context, state.errMessage);
          }
        } else if (state is LoginSuccess) {
          showCustomSnackBar(context, 'Logged in successfully');
          GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
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
