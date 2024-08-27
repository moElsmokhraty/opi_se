import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40.w,
          maxWidth: 40.w,
          minHeight: 30.h,
          maxHeight: 30.h,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 40.w,
          maxWidth: 40.w,
          minHeight: 30.h,
          maxHeight: 30.h,
        ),
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
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
            width: 1.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: readOnly
                ? Colors.black.withOpacity(0.4)
                : const Color(0xFF247CFF),
            width: readOnly ? 1.w : (1.5).w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: (1.5).w,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 14.sp,
      ),
      validator: validator,
      onTap: onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
