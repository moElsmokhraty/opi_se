import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class SelectedChoiceItem extends StatelessWidget {
  const SelectedChoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      decoration: ShapeDecoration(
        color: const Color(0x3F036666),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0xFF036666)),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color(0xFF036666),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.checkmark_alt,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Text(
            '6-8 hours',
            style: AppStyles.textStyle16.copyWith(
              color: const Color(0xFF036666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
