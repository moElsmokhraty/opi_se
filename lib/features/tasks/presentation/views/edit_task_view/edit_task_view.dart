import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/edit_task_app_bar.dart';
import 'widgets/edit_task_view_body.dart';
import '../../../../../core/utils/routes_config/routes_config.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
      },
      child: const Scaffold(
        appBar: EditTaskAppBar(),
        body: SafeArea(
          child: EditTaskViewBody(),
        ),
      ),
    );
  }
}
