import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthOptionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthOptionsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(66.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leadingWidth: 0,
      backgroundColor: Colors.white,
      leading: const SizedBox.shrink(),
      title: Text(
        'Sign Up as:',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 30.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
