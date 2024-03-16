import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesOrNoSelection extends StatelessWidget {
  const YesOrNoSelection({
    super.key,
    required this.isYes,
    this.onYesSelected,
    this.onNoSelected,
  });

  final bool? isYes;
  final void Function()? onYesSelected;
  final void Function()? onNoSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onYesSelected,
          child: Container(
            width: 82.w,
            height: 72.h,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: (isYes == null)
                  ? const Color(0XFFF6F6F6)
                  : isYes!
                      ? const Color(0xFF036666).withOpacity(0.25)
                      : const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            child: Text(
              'Yes',
              style: TextStyle(
                color: (isYes == null)
                    ? Colors.black
                    : isYes!
                        ? const Color(0xFF036666)
                        : Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        Container(
          width: 4.w,
          height: 72.h,
          color: Colors.black.withOpacity(0.1),
        ),
        GestureDetector(
          onTap: onNoSelected,
          child: Container(
            width: 82.w,
            height: 72.h,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: (isYes == null)
                  ? const Color(0XFFF6F6F6)
                  : isYes!
                      ? const Color(0XFFF6F6F6)
                      : const Color(0xFF036666).withOpacity(0.25),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Text(
              'No',
              style: TextStyle(
                color: (isYes == null)
                    ? Colors.black
                    : isYes!
                        ? Colors.black
                        : const Color(0xFF036666),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
