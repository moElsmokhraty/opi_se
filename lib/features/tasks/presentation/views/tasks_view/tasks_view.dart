import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../domain/use_cases/delete_task_use_case.dart';
import '../../../domain/use_cases/get_specific_tasks_type_use_case.dart';
import '../../cubits/tasks_cubit/tasks_cubit.dart';
import 'widgets/tasks_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(
        getIt.get<GetSpecificTasksTypeUseCase>(),
        getIt.get<DeleteTaskUseCase>(),
      )
        ..getTodoTasks()
        ..getInProgressTasks()
        ..getDoneTasks()
        ..listenOnGetTaskFromSocket()
        ..listenOnTaskDeletedFromSocket()
        ..listenOnTaskUpdatedFromSocket(),
      child: const TasksViewBody(),
    );
  }
}
