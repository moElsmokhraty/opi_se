import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/mentor_second_register_view_body.dart';
import '../../../../../core/widgets/app_bars/auth_app_bar.dart';

class MentorSecondRegisterView extends StatelessWidget {
  const MentorSecondRegisterView({super.key});

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
          child: MentorSecondRegisterViewBody(),
        ),
      ),
    );
  }
}
