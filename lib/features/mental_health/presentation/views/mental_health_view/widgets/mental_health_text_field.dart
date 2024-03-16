import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentalHealthTextField extends StatelessWidget {
  const MentalHealthTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 5,
      maxLines: 8,
      controller: controller,
      style: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        hintText: 'Your answer...',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
