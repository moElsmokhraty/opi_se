import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneMoreWidget extends StatelessWidget {
  const OneMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'One More...',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
        Stack(
          children: [
            Container(
              width: screenWidth,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            Container(
              width: screenWidth * 0.6,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFF036666),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
