import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/styling/styles.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color(0xFF036666),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(50.r),
        ),
        fixedSize: Size(380.w, 60.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/upload.svg',
            width: 20.w,
            height: 20.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF036666),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w), // SizedBox
          Text(
            'Upload $text',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16.copyWith(
              color: const Color(0xFF036666),
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
