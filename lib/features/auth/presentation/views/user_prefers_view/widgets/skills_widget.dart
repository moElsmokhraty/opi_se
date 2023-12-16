import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key, required this.cubit});

  final UserPrefersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: cubit.skills.isEmpty ? 0 : 4.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        spacing: 8.w,
        children: [
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: cubit.skills.map((skill) {
              return Chip(
                backgroundColor: const Color(0XFF036666),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                label: Text(
                  '${skill.skillName!}    ${skill.skillRate}',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                deleteIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: Colors.white,
                ),
                deleteButtonTooltipMessage: 'Remove Skill',
                onDeleted: () {
                  cubit.removeSkill(skill);
                },
              );
            }).toList(),
          ),
          SizedBox(
            width: cubit.skills.isEmpty ? double.infinity : 70.w,
            child: TextField(
              controller: cubit.skillController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter Skill',
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onChanged: (value) {
                cubit.toggleSlider();
              },
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
