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
      scrolledUnderElevation: 0,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Row(
          children: [
            GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24.sp,
              ),
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
            SizedBox(width: 10.w),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
