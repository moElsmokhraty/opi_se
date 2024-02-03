import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  final String errorMessage;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/error.png',
            height: 350.h,
            width: double.infinity,
          ),
          SizedBox(height: 10.h),
          Text(
            errorMessage,
            style: TextStyle(
              color: const Color(0XFF036666),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'We’re Having Trouble Loading This Page.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 32.h),
          AuthButton(
            text: 'Return Home',
            onPressed: onPressed,
            backColor: const Color(0XFF036666),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
