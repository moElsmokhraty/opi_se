import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/styling/styles.dart';
import '../../../../../../auth/presentation/views/user_prefers_view/widgets/selection_item.dart';
import '../../../../cubits/mental_health_cubit.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<MentalHealthCubit, MentalHealthState>(
      builder: (context, state) {
        final MentalHealthCubit cubit =
            BlocProvider.of<MentalHealthCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3.  What is your education?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            SelectionItem(
              isSelected: cubit.education == 'Phd',
              text: 'Phd',
              onTap: () {
                cubit.setEducation('Phd');
              },
            ),
            SizedBox(height: screenHeight * 0.025),
            SelectionItem(
              isSelected: cubit.education == 'Master',
              text: 'Master',
              onTap: () {
                cubit.setEducation('Master');
              },
            ),
            SizedBox(height: screenHeight * 0.025),
            SelectionItem(
              isSelected: cubit.education == 'Undergraduate',
              text: 'Undergraduate',
              onTap: () {
                cubit.setEducation('Undergraduate');
              },
            ),
            SizedBox(height: screenHeight * 0.025),
            SelectionItem(
              isSelected: cubit.education == 'High School',
              text: 'High School',
              onTap: () {
                cubit.setEducation('High School');
              },
            ),
          ],
        );
      },
    );
  }
}
