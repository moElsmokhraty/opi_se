import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_chip.dart';
import 'tag_editor.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key, required this.cubit});

  final UserPrefersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
  }
}
