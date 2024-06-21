import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_bars/auth_app_bar.dart';
import 'widgets/mentor_login_otp_view_body.dart';

class MentorLoginOtpView extends StatelessWidget {
  const MentorLoginOtpView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AuthAppBar(hasBackButton: false),
        body: SafeArea(
          child: MentorLoginOtpViewBody(email: email),
        ),
      ),
    );
  }
}
