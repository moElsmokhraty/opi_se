import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/styling/styles.dart';

class UnSelectedChoiceItem extends StatelessWidget {
  const UnSelectedChoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  width: (1.5).w,
                  color: const Color(0xFF036666),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Text(
            'less than 6 hours',
            style: AppStyles.textStyle16.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
