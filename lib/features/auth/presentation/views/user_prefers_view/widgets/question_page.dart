import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/selection_item.dart';
import 'finish_button.dart';
import 'next_button.dart';
import 'previous_button.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    super.key,
    required this.index,
    required this.question,
    required this.cubit,
  });

  final int index;
  final String question;
  final UserPrefersCubit cubit;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              question,
              style: AppStyles.textStyle24.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 4,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          SelectionItem(
            isSelected: cubit.answers[index] ?? false,
            text: 'Yes',
            onTap: () {
              cubit.setAnswer(index, true);
            },
          ),
          SizedBox(height: screenHeight * 0.025),
          SelectionItem(
            isSelected:
                cubit.answers[index] == null ? false : !cubit.answers[index]!,
            text: 'No',
            onTap: () {
              cubit.setAnswer(index, false);
            },
          ),
          SizedBox(height: screenHeight * 0.05),
          index == 0 || index == 1 || index == 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PreviousButton(onTap: () {
                      cubit.previousPage();
                    }),
                    NextButton(onTap: () {
                      cubit.nextPage();
                    }),
                  ],
                )
              : Row(
                  mainAxisAlignment: cubit.state is SubmitUserPrefersLoading
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.end,
                  children: [
                    FinishButton(
                      onTap: () async {
                        if (cubit.answers.contains(null)) {
                          showCustomSnackBar(
                              context, 'Please answer all questions');
                        } else {
                          await cubit.submitUserPrefers();
                        }
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
