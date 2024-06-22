import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMentorTextField extends StatelessWidget {
  const SearchMentorTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 7,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 24.sp,
            color: Colors.black.withOpacity(0.4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF247CFF),
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 16.w,
          ),
          hintText: 'Search by topic, tags',
          hintStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.black.withOpacity(0.4),
            fontFamily: 'Inter',
          ),
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
