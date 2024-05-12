import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '/core/utils/styling/app_assets.dart';
import 'skip_text.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 45.sp),
      child: Column(
        children: [
          Image.asset(
            AppAssets.firstOnboarding,
            height: 400.h,
            width: 400.w,
          ),
          Text(
            'Get Your Study Partner',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Through Opi Se , You will find a study partner to work together for achieving your goals',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SkipText(),
              GestureDetector(
                onTap: () async {
                  await BlocProvider.of<OnboardingCubit>(context).nextPage();
                },
                child: Container(
                  height: 50.h,
                  width: 50.h,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    color: Color(0XFF036666),
                    shape: OvalBorder(),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 22.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
