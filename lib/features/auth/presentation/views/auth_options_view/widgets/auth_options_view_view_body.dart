import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class AuthOptionsViewBody extends StatelessWidget {
  const AuthOptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/auth_options.png',
            height: 400.h,
            width: double.infinity,
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
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushReplacement(RoutesConfig.firstRegister);
              },
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
              onPressed: () {
                GoRouter.of(context).pushReplacement(RoutesConfig.login);
              },
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
                'Login',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: const Color(0xff036666),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
