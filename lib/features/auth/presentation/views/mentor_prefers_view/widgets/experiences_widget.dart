import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'experience_item.dart';
import 'add_experience_widget.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class ExperiencesWidget extends StatelessWidget {
  const ExperiencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MentorPrefersCubit cubit = BlocProvider.of(context);
    return BlocBuilder<MentorPrefersCubit, MentorPrefersState>(
      builder: (context, state) {
        if (cubit.experiences.isEmpty) {
          return const AddExperienceWidget();
        } else {
          return SizedBox(
            height: 0.5.sh,
            child: ListView.separated(
              itemCount: cubit.experiences.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (context, index) {
                return ExperienceItem(
                  experience: cubit.experiences[index],
                  index: index,
                );
              },
            ),
          );
        }
      },
    );
  }
}
