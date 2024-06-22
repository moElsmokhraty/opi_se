import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMentorResultsList extends StatelessWidget {
  const SearchMentorResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200.h,
      right: 0,
      left: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.black.withOpacity(0.25)),
        ),
        child: SizedBox(
          height: 250.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    'assets/images/avatar_image.png',
                    height: 50.h,
                    width: 50.w,
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    children: [
                      Text(
                        'Mohamed Ali',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'UI/UX Designer',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0XFF036666).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Add Mentor',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
