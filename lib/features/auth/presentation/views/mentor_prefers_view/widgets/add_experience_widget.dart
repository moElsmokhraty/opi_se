import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_experience_button.dart';

class AddExperienceWidget extends StatelessWidget {
  const AddExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 340.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1.5.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddExperienceButton(),
          SizedBox(height: 20.h),
          Text(
            'Add your experience',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
