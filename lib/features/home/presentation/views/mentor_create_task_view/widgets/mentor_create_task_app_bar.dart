import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class MentorCreateTaskAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MentorCreateTaskAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
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
      actions: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RoutesConfig.taskSettings);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: const Color(0XFF036666),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'Publish',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
