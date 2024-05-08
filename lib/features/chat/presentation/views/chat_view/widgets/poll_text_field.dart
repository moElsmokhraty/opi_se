import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PollTextField extends StatelessWidget {
  const PollTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isLast = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          isLast ? 200.w : (hintText == 'Type your Question' ? 315.w : 235.w),
      child: TextFormField(
        controller: controller,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          errorStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.red,
            fontSize: 12.sp,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
            fontSize: 14.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.4),
              width: 1.w,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.4),
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: const Color(0xFF247CFF),
              width: (1.5).w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: (1.5).w,
            ),
          ),
          prefixIcon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey[700],
            size: 20.w,
          ),
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14.sp,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Required';
          }
          return null;
        },
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onFieldSubmitted: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
