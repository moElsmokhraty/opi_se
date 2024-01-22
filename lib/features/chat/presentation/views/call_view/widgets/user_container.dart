import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.h,
      right: 16.w,
      child: Container(
        width: 240.w,
        height: 150.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 25,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: const Color(0x66036666),
            child: Text(
              'NA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
