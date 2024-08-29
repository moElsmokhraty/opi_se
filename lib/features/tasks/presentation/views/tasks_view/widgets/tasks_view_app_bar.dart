import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';

import '../../../../../../core/utils/constants.dart';

class TasksViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TasksViewAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 75.h,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        'Tasks',
        style: TextStyle(
          fontSize: 28.sp,
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: (userCache?.partner?.id == null)
          ? null
          : [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(RoutesConfig.addTask);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF036666),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_outlined,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Add Task',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
      leadingWidth: 12.w,
      leading: const SizedBox.shrink(),
    );
  }
}
