import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../domain/use_cases/add_task_use_case.dart';
import '../../cubits/add_task_cubit/add_task_cubit.dart';
import 'widgets/add_task_app_bar.dart';
import 'widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(getIt.get<AddTaskUseCase>()),
      child: const Scaffold(
        appBar: AddTaskAppBar(),
        body: SafeArea(
          child: AddTaskViewBody(),
        ),
      ),
    );
  }
}
