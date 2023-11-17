import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class SelectionItem extends StatelessWidget {
  const SelectionItem({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 370.w,
        height: 58.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0x3F036666) : const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            side: isSelected
                ? BorderSide(width: 1.w, color: const Color(0xFF036666))
                : BorderSide.none,
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
                color: isSelected ? const Color(0xFF036666) : Colors.white,
                shape: BoxShape.circle,
                border: isSelected
                    ? null
                    : Border.fromBorderSide(
                        BorderSide(
                          width: (1.5).w,
                          color: const Color(0xFF036666),
                        ),
                      ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 15.w),
            Text(
              text,
              style: AppStyles.textStyle16.copyWith(
                color: isSelected ? const Color(0xFF036666) : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
