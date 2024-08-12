import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorRegisterText extends StatelessWidget {
  const MentorRegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Don\' Have Account Yet? ',
            style: TextStyle(
              letterSpacing: 1.1,
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0XFF8E8E8E),
            ),
            children: [
              TextSpan(
                text: 'Sign Up!',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontFamily: 'Inter',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
