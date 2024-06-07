import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/auth_options_app_bar.dart';
import 'widgets/auth_options_view_view_body.dart';

class AuthOptionsView extends StatelessWidget {
  const AuthOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: AuthOptionsAppBar(),
        body: SafeArea(
          child: AuthOptionsViewBody(),
        ),
      ),
    );
  }
}
