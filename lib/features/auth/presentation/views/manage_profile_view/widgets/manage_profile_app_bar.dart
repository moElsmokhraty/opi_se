import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ManageProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ManageProfileAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 75.h,
      titleSpacing: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
