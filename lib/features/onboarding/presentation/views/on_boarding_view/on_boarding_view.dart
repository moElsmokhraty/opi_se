import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';
import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        await BlocProvider.of<OnboardingCubit>(context).handleBackButton();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: OnBoardingViewBody(),
        ),
      ),
    );
  }
}
