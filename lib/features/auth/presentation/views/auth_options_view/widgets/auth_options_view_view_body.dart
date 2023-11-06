import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthOptionsViewBody extends StatelessWidget {
  const AuthOptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/auth_options.png',
          height: 400.h,
          width: 400.w,
        ),
        Text(
          'Welcome to',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 45.sp,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'OpiSe',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 45.sp,
            color: const Color(0XFF036666),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0.5,
              shadowColor: Colors.transparent,
              backgroundColor: const Color(0xff036666),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.r),
              ),
              fixedSize: Size(327.w, 52.h),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0.5,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const Color(0xff036666),
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(22.r),
              ),
              fixedSize: Size(327.w, 52.h),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: const Color(0xff036666),
              ),
            ),
          ),
        )
      ],
    );
  }
}
