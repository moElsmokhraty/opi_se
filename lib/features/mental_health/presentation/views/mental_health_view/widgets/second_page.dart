import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/buttons/previous_button.dart';
import 'second_page_widgets/certain_actions_widget.dart';
import 'second_page_widgets/challenging_to_focus_widget.dart';
import 'second_page_widgets/control_emotions_widget.dart';
import 'second_page_widgets/engage_in_repetitive_behaviours.dart';
import 'second_page_widgets/excessive_worry_widget.dart';
import 'second_page_widgets/feel_down_widget.dart';
import 'second_page_widgets/feel_tired_widget.dart';
import 'second_page_widgets/intrusive_thoughts_widget.dart';
import 'second_page_widgets/lost_interest_widget.dart';
import 'second_page_widgets/mood_changes_widget.dart';
import 'second_page_widgets/nervous_widget.dart';
import 'second_page_widgets/on_edge_widget.dart';
import 'second_page_widgets/one_more_widget.dart';
import 'second_page_widgets/repetitive_thoughts_widget.dart';
import 'second_page_widgets/sleeping_patterns_widget.dart';
import 'second_page_widgets/sudden_discomfort_widget.dart';
import '../../../cubits/mental_health_cubit.dart';
import 'second_page_widgets/concentrating_difficulty_widget.dart';
import '../../../../../../core/widgets/buttons/next_button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final MentalHealthCubit cubit = BlocProvider.of<MentalHealthCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OneMoreWidget(),
            SizedBox(height: screenHeight * 0.04),
            const NervousWidget(),
            SizedBox(height: screenHeight * 0.075),
            const ExcessiveWorryWidget(),
            SizedBox(height: screenHeight * 0.075),
            const OnEdgeWidget(),
            SizedBox(height: screenHeight * 0.075),
            const FeelDownWidget(),
            SizedBox(height: screenHeight * 0.075),
            const LostInterestWidget(),
            SizedBox(height: screenHeight * 0.075),
            const ConcentratingDifficulty(),
            SizedBox(height: screenHeight * 0.075),
            const ChallengingToFocusWidget(),
            SizedBox(height: screenHeight * 0.075),
            const RepetitiveThoughtsWidget(),
            SizedBox(height: screenHeight * 0.075),
            const IntrusiveThoughtsWidget(),
            SizedBox(height: screenHeight * 0.075),
            const MoodChangesWidget(),
            SizedBox(height: screenHeight * 0.075),
            const ControlEmotionsWidget(),
            SizedBox(height: screenHeight * 0.075),
            const SuddenDiscomfortWidget(),
            SizedBox(height: screenHeight * 0.075),
            const EngageInRepetitiveBehaviours(),
            SizedBox(height: screenHeight * 0.075),
            const CertainActionsWidget(),
            SizedBox(height: screenHeight * 0.075),
            const FeelTiredWidget(),
            SizedBox(height: screenHeight * 0.075),
            const SleepingPatternsWidget(),
            SizedBox(height: screenHeight * 0.085),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PreviousButton(onTap: () {
                  cubit.secondPagePrevious();
                }),
                NextButton(onTap: () {
                  cubit.secondPageNext(context);
                }),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
