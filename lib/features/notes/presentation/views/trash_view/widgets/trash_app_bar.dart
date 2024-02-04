import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrashAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Trash',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
