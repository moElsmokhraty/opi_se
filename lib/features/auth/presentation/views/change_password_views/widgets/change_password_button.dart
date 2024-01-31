import 'package:flutter/material.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/change_password_cubit/change_password_cubit.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ChangePasswordCubit cubit;
  final ChangePasswordState state;

  @override
  Widget build(BuildContext context) {
    if (state is ChangePasswordLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xff036666)),
      );
    } else {
      return AuthButton(
        text: 'Save',
        onPressed: () async {
          await cubit.changePassword();
        },
        backColor: const Color(0xff036666),
        textColor: Colors.white,
      );
    }
  }
}
