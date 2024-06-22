import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMentorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchMentorAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 24.w,
      title: Text(
        'Mentor',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
