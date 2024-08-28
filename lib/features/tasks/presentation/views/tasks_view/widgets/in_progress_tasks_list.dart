import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/tasks_cubit/tasks_cubit.dart';
import 'task_item.dart';

class InProgressTasksList extends StatelessWidget {
  const InProgressTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getInProgressTasks();
      },
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is DeleteTaskFailure && cubit.selectedIndex == 1) {
            showCustomSnackBar(context, state.errMessage);
          } else if (state is DeleteTaskSuccess && cubit.selectedIndex == 1) {
            showCustomSnackBar(context, 'Task deleted successfully');
          } else if (state is GetTasksFailure &&
              state.index == 1 &&
              cubit.inProgressTasks.isNotEmpty &&
              cubit.selectedIndex == 1) {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetTasksLoading && cubit.inProgressTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 0.5.sh,
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF036666)),
                ),
              ),
            );
          } else if (state is GetTasksFailure &&
              cubit.inProgressTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_notes.png',
                    width: double.infinity,
                    height: 350.h,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else if ((state is GetTasksSuccess || state is DeleteTaskSuccess) &&
              cubit.inProgressTasks.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_notes.png',
                    width: double.infinity,
                    height: 350.h,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'No In Progress Tasks Found',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'You don\'t have any in progress tasks at the moment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.inProgressTasks.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TaskItem(task: cubit.inProgressTasks[index]);
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
