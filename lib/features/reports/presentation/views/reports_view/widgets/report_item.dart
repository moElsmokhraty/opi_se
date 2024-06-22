import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 290.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UX Quiz',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        'Mohamed Ali',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF0000).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        '30%',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: const Color(0xFFFF0000),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  '6 Questions Answered',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Date: 12/12/2021',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Icon(
                CupertinoIcons.delete_simple,
                color: Colors.black.withOpacity(0.7),
                size: 20.sp,
              ),
              SizedBox(height: 62.h),
              Icon(
                Icons.visibility_outlined,
                color: const Color(0XFF036666),
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
