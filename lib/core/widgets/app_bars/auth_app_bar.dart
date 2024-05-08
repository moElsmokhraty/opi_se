import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key, this.actions});

  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      titleSpacing: 20.w,
      title: Image.asset(
        'assets/images/opi_se_logo.png',
        width: 150.w,
        height: 100.h,
      ),
      toolbarHeight: 60.h,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.white,
      actions: actions,
    );
  }
}
