import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/styling/styles.dart';
import '../../../../cubits/mental_health_cubit.dart';
import '../yes_or_no_selection.dart';

class LostInterestWidget extends StatelessWidget {
  const LostInterestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<MentalHealthCubit, MentalHealthState>(
      builder: (context, state) {
        final MentalHealthCubit cubit =
            BlocProvider.of<MentalHealthCubit>(context);
        return Column(
          children: [
            Text(
              '5. Have you lost interest or pleasure in activities you used to enjoy?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.lostInterestInActivities,
              onYesSelected: () {
                cubit.setLostInterestInActivities(true);
              },
              onNoSelected: () {
                cubit.setLostInterestInActivities(false);
              },
            ),
          ],
        );
      },
    );
  }
}
