import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 60.w,
      backgroundColor: Colors.white,
      leading: IconButton(
        padding: EdgeInsets.only(left: 12.w),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20.sp,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Notifications',
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
