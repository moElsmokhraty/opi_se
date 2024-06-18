import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/quiz_settings_app_bar.dart';
import 'widgets/quiz_settings_view_body.dart';

class QuizSettingsView extends StatelessWidget {
  const QuizSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: QuizSettingsAppBar(),
        body: QuizSettingsViewBody(),
      ),
    );
  }
}
