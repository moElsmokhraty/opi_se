import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/mental_health/presentation/cubits/mental_health_cubit.dart';

import '../../../../../../../core/utils/styling/styles.dart';
import '../yes_or_no_selection.dart';

class CertainActionsWidget extends StatelessWidget {
  const CertainActionsWidget({super.key});

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
              '14. Have you felt driven to perform certain actions repeatedly?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.drivenToPerformRepetitiveActs,
              onYesSelected: () {
                cubit.setDrivenToPerformRepetitiveActs(true);
              },
              onNoSelected: () {
                cubit.setDrivenToPerformRepetitiveActs(false);
              },
            ),
          ],
        );
      },
    );
  }
}
