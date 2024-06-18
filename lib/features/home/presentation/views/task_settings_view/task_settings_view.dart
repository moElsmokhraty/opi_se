import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/task_settings_app_bar.dart';
import 'widgets/task_settings_view_body.dart';

class TaskSettingsView extends StatelessWidget {
  const TaskSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: TaskSettingsAppBar(),
        body: TaskSettingsViewBody(),
      ),
    );
  }
}
