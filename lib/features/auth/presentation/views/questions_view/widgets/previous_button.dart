import 'package:flutter/material.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: (1.5).w, color: const Color(0xFF036666)),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            color: const Color(0xFF036666),
            size: 20.sp,
          ),
          Text(
            'Next',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16.copyWith(
              color: const Color(0xFF036666),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
