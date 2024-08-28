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
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getDoneTasks();
      },
      child: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is DeleteTaskFailure && cubit.selectedIndex == 2) {
            showCustomSnackBar(context, state.errMessage);
          } else if (state is DeleteTaskSuccess && cubit.selectedIndex == 2) {
            showCustomSnackBar(context, 'Task deleted successfully');
          } else if (state is GetTasksFailure &&
              state.index == 1 &&
              cubit.doneTasks.isNotEmpty &&
              cubit.selectedIndex == 2) {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetTasksLoading && cubit.doneTasks.isEmpty) {
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
          } else if (state is GetTasksFailure && cubit.doneTasks.isEmpty) {
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
              cubit.doneTasks.isEmpty) {
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
                    'No Done Tasks Found',
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
                    'You don\'t have any done tasks at the moment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.doneTasks.length,
              physics: const AlwaysScrollableScrollPhysics(),
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
