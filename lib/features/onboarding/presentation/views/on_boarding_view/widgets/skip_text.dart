import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await BlocProvider.of<OnboardingCubit>(context).skipOnboarding();
      },
      child: Text(
        'Skip',
        style: TextStyle(
          fontSize: 22.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          color: const Color(0XFF036666),
        ),
      ),
    );
  }
}
