import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constants.dart';

class CustomColorSelector extends StatelessWidget {
  const CustomColorSelector({
    super.key,
    required this.onTap,
    required this.color,
  });

  final void Function() onTap;

  final String color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: noteColors[color],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
