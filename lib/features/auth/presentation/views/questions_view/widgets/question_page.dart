import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'previous_button.dart';
import 'next_button.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/widgets/selected_choice_item.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/widgets/unselected_choice_item.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Text(
            'Behavioural Questions',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          Text(
            'We will ask you some questions about you, fell free to answer and take your time',
            style: AppStyles.textStyle12.copyWith(fontSize: 14.sp),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.055),
          Text(
            'How many hours do you sleep?',
            style: AppStyles.textStyle24,
            maxLines: 4,
          ),
          SizedBox(height: screenHeight * 0.04),
          const SelectedChoiceItem(),
          SizedBox(height: screenHeight * 0.025),
          const UnSelectedChoiceItem(),
          SizedBox(height: screenHeight * 0.025),
          const UnSelectedChoiceItem(),
          SizedBox(height: screenHeight * 0.05),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PreviousButton(),
              NextButton(),
            ],
          )
        ],
      ),
    );
  }
}
