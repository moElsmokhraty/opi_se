import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/login_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, this.hasBackButton = true});

  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AuthAppBar(hasBackButton: hasBackButton),
        body: const SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
