import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/styling/styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        backgroundColor: const Color(0xFF036666),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        fixedSize: Size(150.w, 50.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Next',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
