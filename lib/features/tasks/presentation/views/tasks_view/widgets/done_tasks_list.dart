import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/tasks_cubit/tasks_cubit.dart';
import 'task_item.dart';

class DoneTasksList extends StatelessWidget {
  const DoneTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return Expanded(
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is GetTasksFailure &&
              cubit.doneTasks.isEmpty &&
              cubit.selectedIndex == 2) {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetTasksLoading && cubit.doneTasks.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0XFF036666),
              ),
            );
          } else if (state is GetTasksFailure && cubit.doneTasks.isEmpty) {
            return Center(
              child: Text(
                state.errMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                ),
              ),
            );
          } else if (cubit.doneTasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
              ),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.doneTasks.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return TaskItem(task: cubit.doneTasks[index]);
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
