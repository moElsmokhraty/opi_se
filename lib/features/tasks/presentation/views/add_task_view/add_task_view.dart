import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/routes_config/routes_config.dart';
import 'widgets/add_task_app_bar.dart';
import 'widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        await GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
      },
      child: const Scaffold(
        appBar: AddTaskAppBar(),
        body: SafeArea(
          child: AddTaskViewBody(),
        ),
      ),
    );
  }
}
