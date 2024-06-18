import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskSettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TaskSettingsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24.sp,
          ),
        ),
      ),
      centerTitle: true,
      title: const Text('Task Settings'),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
