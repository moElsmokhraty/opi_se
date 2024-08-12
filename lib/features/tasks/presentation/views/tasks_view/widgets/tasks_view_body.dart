import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'done_tasks_list.dart';
import 'todo_tasks_list.dart';
import 'task_type_tabs_widget.dart';
import 'in_progress_tasks_list.dart';
import '../../../cubits/tasks_cubit/tasks_cubit.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        if (cubit.selectedIndex == 0) {
          await cubit.getTodoTasks();
        } else if (cubit.selectedIndex == 1) {
          await cubit.getInProgressTasks();
        } else {
          await cubit.getDoneTasks();
        }
      },
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.03),
          // const TasksCalendar(),
          // SizedBox(height: screenHeight * 0.05),
          const TaskTypeTabsWidget(),
          SizedBox(height: screenHeight * 0.03),
          BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              if (cubit.selectedIndex == 0) {
                return const TodoTasksList();
              } else if (cubit.selectedIndex == 1) {
                return const InProgressTasksList();
              } else {
                return const DoneTasksList();
              }
            },
          ),
        ],
      ),
    );
  }
}
