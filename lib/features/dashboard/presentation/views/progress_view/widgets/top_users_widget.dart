import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopUsersWidget extends StatelessWidget {
  const TopUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 16.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/avatar_image.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '1940 Coins',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black.withOpacity(0.4),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0XFF036666),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(width: 32.w),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/avatar_image.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '1940 Coins',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black.withOpacity(0.4),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0XFF036666),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
