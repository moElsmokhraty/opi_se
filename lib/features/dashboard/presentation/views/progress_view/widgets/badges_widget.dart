import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgesWidget extends StatelessWidget {
  const BadgesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: const Color(0XFF036666),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'All Badges',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/avatar1.png',
                    width: 35.w,
                    height: 50.h,
                  ),
                  Text(
                    'Bronze',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/avatar2.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                  Text(
                    'Silver',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/avatar3.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                  Text(
                    'Gold',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/avatar4.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                  Text(
                    'Platinum',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 30.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 240.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                Positioned(
                  left: 0.w,
                  child: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5.r),
                      border: Border.all(
                        color: const Color(0XFF036666),
                        width: 5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70.w,
                  child: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5.r),
                      border: Border.all(
                        color: const Color(0XFF036666),
                        width: 5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 145.w,
                  child: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5.r),
                      border: Border.all(
                        color: const Color(0XFF036666),
                        width: 5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 225.w,
                  child: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5.r),
                      border: Border.all(
                        color: const Color(0XFF036666),
                        width: 5,
                      ),
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
