import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyWidget extends StatelessWidget {
  const StudyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: const Color(0XFF036666),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/avatar1.png',
            width: 75.w,
            height: 75.h,
          ),
          SizedBox(width: 12.w),
          SizedBox(
            width: 1.sw - 145.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/coin.png',
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '100 Coins',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0XFFFFCE04),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Study to earn your badge',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 260.w,
                  height: 32.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    '10 / 10',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
