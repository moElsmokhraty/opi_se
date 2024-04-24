import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';

class AddTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddTaskAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 60.h,
      title: Text(
        'Add Task',
        style: TextStyle(
          fontSize: 28.sp,
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      leadingWidth: 60.w,
      leading: Row(
        children: [
          SizedBox(width: 12.w),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24.sp,
            ),
            onPressed: () {
              GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
            },
          ),
        ],
      ),
    );
  }
}
