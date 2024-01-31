import 'package:flutter/material.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ForgotPasswordCubit cubit;
  final ForgotPasswordState state;

  @override
  Widget build(BuildContext context) {
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
  }
}
