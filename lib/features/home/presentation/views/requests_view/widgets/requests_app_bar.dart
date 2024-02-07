import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RequestsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        'Requests',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
