import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
        child: Row(
          children: [
            Image.asset(
              'assets/images/avatar_image.png',
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Nada',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Welcome Back!',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Notifications',
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          icon: Icon(
            CupertinoIcons.bell_fill,
            color: const Color(0xFF036666),
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
