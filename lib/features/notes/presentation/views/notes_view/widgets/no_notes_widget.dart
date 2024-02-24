import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Image.asset(
            'assets/images/no_notes.png',
            height: 350.h,
            width: double.infinity,
          ),
          SizedBox(height: 22.h),
          Text(
            'No Notes Yet',
            style: TextStyle(
              fontSize: 28.sp,
              fontFamily: 'Inter',
              color: const Color(0XFF036666),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
