import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCallButton extends StatelessWidget {
  const CustomCallButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.buttonColor = Colors.white,
    this.iconColor = Colors.black,
    this.shape = const CircleBorder(),
  });

  final IconData icon;
  final void Function() onPressed;
  final Color buttonColor;
  final Color iconColor;
  final OutlinedBorder shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: shape,
        surfaceTintColor: buttonColor,
        backgroundColor: buttonColor,
        elevation: 4,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15.sp),
        fixedSize: Size(55.w, 55.h),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 24.sp,
      ),
    );
  }
}
