import 'package:flutter/material.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/verify_account_cubit/verify_account_cubit.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({
    super.key,
    required this.email,
    required this.cubit,
    required this.state,
  });

  final String email;
  final VerifyAccountCubit cubit;
  final VerifyAccountState state;

  @override
  Widget build(BuildContext context) {
    if (state is VerifyAccountLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xff036666)),
      );
    } else {
      return AuthButton(
        text: 'Resend Email',
        onPressed: () async {
          await cubit.verifyAccount(email);
        },
        backColor: const Color(0xff036666),
        textColor: Colors.white,
      );
    }
  }
}
