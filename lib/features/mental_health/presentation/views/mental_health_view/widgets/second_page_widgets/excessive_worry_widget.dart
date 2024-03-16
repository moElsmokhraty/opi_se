import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/mental_health/presentation/cubits/mental_health_cubit.dart';
import '../../../../../../../core/utils/styling/styles.dart';
import '../yes_or_no_selection.dart';

class ExcessiveWorryWidget extends StatelessWidget {
  const ExcessiveWorryWidget({super.key});

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
              '2. Have you been experiencing excessive worry or fear that is difficult to control?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            YesOrNoSelection(
              isYes: cubit.excessiveWorryOrFear,
              onYesSelected: () {
                cubit.setExcessiveWorryOrFear(true);
              },
              onNoSelected: () {
                cubit.setExcessiveWorryOrFear(false);
              },
            ),
          ],
        );
      },
    );
  }
}
