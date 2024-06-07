import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/mentor_login_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';

class MentorLoginView extends StatelessWidget {
  const MentorLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: AuthAppBar(),
        body: SafeArea(child: MentorLoginViewBody()),
      ),
    );
  }
}
