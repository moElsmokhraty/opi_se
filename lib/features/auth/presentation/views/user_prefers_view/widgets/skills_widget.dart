import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_chip.dart';
import '../../../../../../core/widgets/tag_editor.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserPrefersCubit cubit = BlocProvider.of<UserPrefersCubit>(context);
    return BlocBuilder<UserPrefersCubit, UserPrefersState>(
      builder: (context, state) {
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
      },
    );
  }
}
