import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/features/tasks/data/models/task.dart';

import '../../../cubits/tasks_cubit/tasks_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0XFFF6F6F6),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                task.title ?? 'Untitled Task',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                height: 25.h,
                width: 25.w,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 10.h,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(0, -1),
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(1, 0),
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(-1, 0),
                    ),
                  ],
                ),
                child: BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) {
                  if (state is DeleteTaskLoading) {
                    return const CircularProgressIndicator(
                      color: Color(0xFF036666),
                      strokeWidth: 2,
                    );
                  } else {
                    return PopupMenuButton(
                      position: PopupMenuPosition.under,
                      tooltip: 'Options',
                      color: Colors.white,
                      offset: Offset(0, 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text(
                              'Edit Task',
                              style: TextStyle(fontFamily: 'Inter'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(fontFamily: 'Inter'),
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        if (value == 'edit') {
                          GoRouter.of(context)
                              .push(RoutesConfig.editTask, extra: task);
                        } else {
                          await cubit.deleteTask(task.id!);
                        }
                      },
                      child: Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 60.h,
            width: 290.w,
            child: Text(
              task.content ?? 'No description',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.6),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
