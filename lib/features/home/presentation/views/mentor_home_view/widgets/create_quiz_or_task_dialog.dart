import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateQuizOrTaskDialog extends StatelessWidget {
  const CreateQuizOrTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What would you like to create?',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 230.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 24.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Create Quiz',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 230.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 24.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Create Task',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
