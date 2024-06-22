import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraftItem extends StatelessWidget {
  const DraftItem({super.key});

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
          Image.asset(
            'assets/images/partner.png',
            width: 95.w,
            height: 95.h,
          ),
          SizedBox(width: 15.w),
          SizedBox(
            width: 145.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz',
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
                      width: 82.w,
                      child: Text(
                        'UI/UX Quiz',
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
                        color: const Color(0xFFFFA500).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        'Drafts',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: const Color(0xFFFFA500),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  '10 Questions',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Deadline: 12/12/2021',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF366666).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    'Continue Task',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: const Color(0xFF366666),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.delete_simple,
              color: Colors.black.withOpacity(0.7),
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
