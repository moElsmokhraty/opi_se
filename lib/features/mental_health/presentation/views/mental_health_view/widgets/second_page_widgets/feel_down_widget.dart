import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/styling/styles.dart';
import '../../../../cubits/mental_health_cubit.dart';
import '../yes_or_no_selection.dart';

class FeelDownWidget extends StatelessWidget {
  const FeelDownWidget({super.key});

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
              '4.  Do you frequently feel down, sad, or hopeless?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.feelDown,
              onYesSelected: () {
                cubit.setFeelDown(true);
              },
              onNoSelected: () {
                cubit.setFeelDown(false);
              },
            ),
          ],
        );
      },
    );
  }
}
