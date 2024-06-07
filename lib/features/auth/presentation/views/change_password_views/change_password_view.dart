import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/change_password_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
          child: ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
