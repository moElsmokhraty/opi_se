import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterLabel extends StatelessWidget {
  const RegisterLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
              fontSize: 30.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Connect with a Study Buddy today',
            style: TextStyle(
              letterSpacing: 1.1,
              fontFamily: 'Inter',
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
