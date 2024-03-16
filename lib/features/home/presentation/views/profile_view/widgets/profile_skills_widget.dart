import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../auth/data/models/login_models/login_response/user_skill.dart';

class ProfileSkillsWidget extends StatelessWidget {
  const ProfileSkillsWidget({super.key, required this.skills});

  final List<UserSkill> skills;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: skills.map((skill) {
              return Chip(
                backgroundColor: const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF036666)),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        skill.skillName!,
                        style: AppStyles.textStyle24.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        '${skill.skillRate!}',
                        style: AppStyles.textStyle24.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
