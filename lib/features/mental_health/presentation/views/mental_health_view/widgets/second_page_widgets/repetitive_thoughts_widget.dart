import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/styling/styles.dart';
import '../../../../cubits/mental_health_cubit.dart';
import '../yes_or_no_selection.dart';

class RepetitiveThoughtsWidget extends StatelessWidget {
  const RepetitiveThoughtsWidget({super.key});

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
              '8. Do you find yourself caught in repetitive thoughts or concerns that you can\'t seem to shake off?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.caughtInRepetitiveThoughts,
              onYesSelected: () {
                cubit.setCaughtInRepetitiveThoughts(true);
              },
              onNoSelected: () {
                cubit.setCaughtInRepetitiveThoughts(false);
              },
            ),
          ],
        );
      },
    );
  }
}
