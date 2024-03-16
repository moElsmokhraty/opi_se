import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../yes_or_no_selection.dart';
import '../../../../cubits/mental_health_cubit.dart';
import '../../../../../../../core/utils/styling/styles.dart';

class SleepingPatternsWidget extends StatelessWidget {
  const SleepingPatternsWidget({super.key});

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
              '16. Have you noticed changes in your sleeping patterns?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.changesInSleepPatterns,
              onYesSelected: () {
                cubit.setChangesInSleepPatterns(true);
              },
              onNoSelected: () {
                cubit.setChangesInSleepPatterns(false);
              },
            ),
          ],
        );
      },
    );
  }
}
