import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_bars/auth_app_bar.dart';
import 'widgets/mentor_login_otp_view_body.dart';

class MentorLoginOtpView extends StatelessWidget {
  const MentorLoginOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: AuthAppBar(),
        body: SafeArea(
          child: MentorLoginOtpViewBody(),
        ),
      ),
    );
  }
}
