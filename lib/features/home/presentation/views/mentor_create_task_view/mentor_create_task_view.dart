import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/mentor_create_task_app_bar.dart';
import 'widgets/mentor_create_task_view_body.dart';

class MentorCreateTaskView extends StatelessWidget {
  const MentorCreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: MentorCreateTaskAppBar(),
        body: MentorCreateTaskViewBody(),
      ),
    );
  }
}
