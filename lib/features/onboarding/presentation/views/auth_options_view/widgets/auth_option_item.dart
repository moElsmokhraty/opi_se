import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthOptionItem extends StatelessWidget {
  const AuthOptionItem({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  final String text;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190.h,
        decoration: BoxDecoration(
          color: const Color(0XFF036666),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsetsDirectional.only(start: 30.w, end: 6.w),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: const Color(0XFFEDEBDE),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (text == 'Parents')
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0XFFDDDDDD),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
              ],
            ),
            Image.asset(
              image,
              height: 240.h,
              width: 208.w,
            ),
          ],
        ),
      ),
    );
  }
}
