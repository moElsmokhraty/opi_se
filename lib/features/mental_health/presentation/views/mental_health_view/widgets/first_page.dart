import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/mental_health_cubit.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'first_page_widgets/disabled_widget.dart';
import 'first_page_widgets/education_widget.dart';
import 'first_page_widgets/employed_widget.dart';
import 'first_page_widgets/gaps_in_resume_widget.dart';
import 'first_page_widgets/gender_selection_widget.dart';
import 'first_page_widgets/have_internet_widget.dart';
import 'first_page_widgets/have_pc_widget.dart';
import 'first_page_widgets/hospitalized_widget.dart';
import 'first_page_widgets/lets_start_widget.dart';
import 'first_page_widgets/live_with_parents_widget.dart';
import 'mental_health_text_field.dart';
import 'first_page_widgets/read_out_widget.dart';
import '../../../../../../core/widgets/buttons/next_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final MentalHealthCubit cubit = BlocProvider.of<MentalHealthCubit>(context);
    return Form(
      key: cubit.firstPageFormKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LetsStartWidget(),
              SizedBox(height: screenHeight * 0.04),
              Text(
                '1.  How Old Are You?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.ageController),
              SizedBox(height: screenHeight * 0.075),
              const GenderSelectionWidget(),
              SizedBox(height: screenHeight * 0.075),
              const EducationWidget(),
              SizedBox(height: screenHeight * 0.075),
              const EmployedWidget(),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '5. What is your income?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.incomeController),
              SizedBox(height: screenHeight * 0.075),
              const GapsInResumeWidget(),
              SizedBox(height: screenHeight * 0.075),
              const HavePcWidget(),
              SizedBox(height: screenHeight * 0.075),
              const HaveInternetWidget(),
              SizedBox(height: screenHeight * 0.075),
              const LiveWithParentsWidget(),
              SizedBox(height: screenHeight * 0.075),
              const ReadOutWidget(),
              SizedBox(height: screenHeight * 0.075),
              const DisabledWidget(),
              SizedBox(height: screenHeight * 0.075),
              const HospitalizedWidget(),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '13. How many times were you hospitalized for your mental illness?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(
                controller: cubit.timesHospitalizedController,
              ),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '14. How many days were you hospitalized for the mental illness?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(
                controller: cubit.daysHospitalizedController,
              ),
              SizedBox(height: screenHeight * 0.085),
              Align(
                alignment: Alignment.centerRight,
                child: NextButton(
                  onTap: () {
                    cubit.firstPageNext(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
