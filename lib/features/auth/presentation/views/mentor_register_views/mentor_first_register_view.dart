import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/mentor_first_register_view_body.dart';
import '../../../../../core/widgets/app_bars/auth_app_bar.dart';

class MentorFirstRegisterView extends StatelessWidget {
  const MentorFirstRegisterView({super.key});

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
          child: MentorFirstRegisterViewBody(),
        ),
      ),
    );
  }
}
