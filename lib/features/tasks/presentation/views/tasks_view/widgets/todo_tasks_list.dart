import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'task_item.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/tasks/presentation/cubits/tasks_cubit/tasks_cubit.dart';

class TodoTasksList extends StatelessWidget {
  const TodoTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return Expanded(
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is GetTasksFailure &&
              cubit.todoTasks.isNotEmpty &&
              cubit.selectedIndex == 0 &&
              state.errMessage != 'No tasks yet !') {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetTasksLoading && cubit.todoTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 0.5.sh,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Color(0XFF036666),
                ),
              ),
            );
          } else if (state is GetTasksFailure && cubit.todoTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 0.5.sh,
                alignment: Alignment.center,
                child: Text(
                  state.errMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          } else if (cubit.todoTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 0.5.sh,
                alignment: Alignment.center,
                child: Text(
                  'No tasks found',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.todoTasks.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TaskItem(
                  key: UniqueKey(),
                  task: cubit.todoTasks[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 12.h);
              },
            );
          }
        },
      ),
    );
  }
}
