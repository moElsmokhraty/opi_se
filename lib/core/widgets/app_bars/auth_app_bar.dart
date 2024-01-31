import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      titleSpacing: 20.w,
      title: Text(
        'OpiSe',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 35.sp,
          color: const Color(0XFF036666),
        ),
      ),
      leadingWidth: 60.w,
      toolbarHeight: 60.h,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.white,
    );
  }
}
