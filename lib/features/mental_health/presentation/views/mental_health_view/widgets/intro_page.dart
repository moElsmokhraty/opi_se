import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';

import '../../../cubits/mental_health_cubit.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: Text(
          'Mental Health',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 28.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mental_health.png',
              height: 320.h,
              width: double.infinity,
            ),
            Text(
              'Mental Health Test',
              style: TextStyle(
                color: const Color(0XFF036666),
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'You can know your mental health score and get some suggestions. Start a test and take your time answering the questions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0XFF036666).withOpacity(0.5),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            AuthButton(
              text: 'Start Test',
              onPressed: () {
                BlocProvider.of<MentalHealthCubit>(context)
                    .pageController
                    .nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
              },
              backColor: const Color(0XFF036666),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
