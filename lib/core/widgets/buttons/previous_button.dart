import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styling/styles.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: (1.5).w, color: const Color(0xFF036666)),
          borderRadius: BorderRadius.circular(20.r),
        ),
        fixedSize: Size(150.w, 50.h),
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
            'Back',
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
