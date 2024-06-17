import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_chip.dart';
import '../../../../../../core/widgets/tag_editor.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';
import 'edit_skills_level_slider.dart';

class EditSkillsDialog extends StatelessWidget {
  const EditSkillsDialog({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Container(
          width: 0.9.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Skills',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: const Color(0XFF036666),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final ProfileCubit cubit =
                        BlocProvider.of<ProfileCubit>(context);
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: TagEditor(
                        controller: cubit.skillController,
                        length: cubit.skills.length,
                        onTextFieldChanged: (value) {
                          cubit.toggleSlider();
                        },
                        delimiters: const [',', ' '],
                        inputDecoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Skill...',
                        ),
                        tagBuilder: (context, index) => CustomChip(
                          label:
                              '${cubit.skills[index].skillName!}    ${cubit.skills[index].skillRate}',
                          index: index,
                          onDeleted: (index) {
                            cubit.removeSkill(cubit.skills[index]);
                          },
                        ),
                        onTagChanged: (String value) {
                          cubit.addSkill();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                const EditSkillsLevelSlider(),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          side: BorderSide(
                            color: const Color(0XFF036666),
                            width: 0.5.w,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF036666),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF036666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
