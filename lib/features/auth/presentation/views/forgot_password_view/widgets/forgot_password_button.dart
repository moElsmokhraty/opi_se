import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          showCustomSnackBar(context, state.response.message!);
          GoRouter.of(context).go(RoutesConfig.login);
        } else if (state is ForgotPasswordFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      listenWhen: (previous, current) {
        return current is ForgotPasswordSuccess || current is ForgotPasswordFailure;
      },
      builder: (context, state) {
        if (state is ForgotPasswordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        } else {
          return AuthButton(
            text: 'Send',
            onPressed: () async {
              await cubit.forgotPassword();
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
