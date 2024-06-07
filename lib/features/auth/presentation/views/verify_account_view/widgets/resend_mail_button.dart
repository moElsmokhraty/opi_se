import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/verify_account_cubit/verify_account_cubit.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<VerifyAccountCubit>(context);
    return BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
      listener: (context, state) {
        if (state is VerifyAccountFailure) {
          showCustomSnackBar(context, state.errMessage);
        } else if (state is VerifyAccountSuccess) {
          showCustomSnackBar(context, 'Email sent successfully!');
        }
      },
      builder: (context, state) {
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
      },
    );
  }
}
