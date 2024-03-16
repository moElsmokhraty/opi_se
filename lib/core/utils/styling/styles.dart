import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: const Color(0xff9094A0),
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle textStyle24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: const Color(0xff010101),
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle textStyle22 = TextStyle(
    fontSize: 22.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
