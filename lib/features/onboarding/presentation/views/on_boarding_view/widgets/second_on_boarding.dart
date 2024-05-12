import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/app_assets.dart';
import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import 'skip_text.dart';

class SecondOnBoarding extends StatelessWidget {
  const SecondOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 45.sp),
      child: Column(
        children: [
          Image.asset(
            AppAssets.secondOnboarding,
            height: 400.h,
            width: 400.w,
          ),
          Text(
            'Task Management',
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
            'Together, we can streamline your schedule for success!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.217),
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
