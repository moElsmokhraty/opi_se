import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDefaultOutLineGradientButtonWidget extends StatelessWidget {
  const CustomDefaultOutLineGradientButtonWidget({
    super.key,
    required this.name,
    required this.onTap,
    required this.outWidth,
    required this.outHeight,
    required this.innerColor,
    required this.innerWidth,
    required this.innerHeight,
  });
  final String name;
  final void Function()? onTap;
  final double outWidth;
  final double outHeight;
  final double innerWidth;
  final double innerHeight;
  final Color innerColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: outWidth,
            height: outHeight,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color(0xFF8F57E4),
                  Color(0xFFCC465D),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          Container(
            width: innerWidth,
            height: innerHeight,
            decoration: ShapeDecoration(
              color: innerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Circular Std',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.70.w,
            ),
          ),
        ],
      ),
    );
  }
}
