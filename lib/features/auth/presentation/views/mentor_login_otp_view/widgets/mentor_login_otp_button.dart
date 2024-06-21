import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../cubits/mentor_login_otp_cubit/mentor_login_otp_cubit.dart';

class MentorLoginOtpButton extends StatelessWidget {
  const MentorLoginOtpButton({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MentorLoginOtpCubit>(context);
    return BlocConsumer<MentorLoginOtpCubit, MentorLoginOtpState>(
      listener: (context, state) {
        if (state is MentorLoginOtpSuccess) {
          showCustomSnackBar(context, 'Account verified successfully');
          while (context.canPop()) {
            context.pop();
          }
          context.pushReplacement(
            RoutesConfig.mentorLogin,
            extra: false,
          );
        } else if (state is MentorLoginOtpError) {
          showCustomSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is MentorLoginOtpLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0XFF036666)),
          );
        } else {
          return AuthButton(
            text: 'Verify',
            onPressed: () async {
              print(email);
              await cubit.verifyOtp(email);
            },
            backColor: const Color(0XFF036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
