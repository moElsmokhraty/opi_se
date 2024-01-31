import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.only(left: 8.w, right: 4.w),
      backgroundColor: const Color(0XFF036666),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      label: Text(
        label,
        style: AppStyles.textStyle24.copyWith(
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ),
      deleteButtonTooltipMessage: 'Remove Skill',
      deleteIcon: Icon(
        Icons.close,
        size: 16.sp,
        color: Colors.white,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
