import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'first_on_boarding.dart';
import 'third_on_boarding.dart';
import 'second_on_boarding.dart';
import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) => PageView(
        controller: BlocProvider.of<OnboardingCubit>(context).pageController,
        children: const [
          FirstOnBoarding(),
          SecondOnBoarding(),
          ThirdOnBoarding(),
        ],
      ),
    );
  }
}
