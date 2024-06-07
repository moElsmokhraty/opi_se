import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/mental_health/presentation/cubits/mental_health_cubit.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'previous_button.dart';
import 'mental_health_text_field.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final MentalHealthCubit cubit = BlocProvider.of<MentalHealthCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: cubit.thirdPageFormKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'And we are done...',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 25.sp,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Container(
                width: screenWidth,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF036666),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                '1.  How would you describe your feeling at School University work in the last few days?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.response1Controller),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '2. How do you like to spend your free time? how do you feel after it? ',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.response2Controller),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '3.  Life has its up and downs, although handling success can be difficult. setbacks can affect your mental health how do you manage your emotions after failure? ',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.response3Controller),
              SizedBox(height: screenHeight * 0.075),
              Text(
                '4.  How would you describe your feeling at School University work in the best few days?In a broad of sense how would you describe your feeling about the way your life is going on?',
                style: AppStyles.textStyle22,
              ),
              SizedBox(height: screenHeight * 0.02),
              MentalHealthTextField(controller: cubit.response4Controller),
              SizedBox(height: screenHeight * 0.075),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PreviousButton(onTap: () {
                    cubit.thirdPagePrevious();
                  }),
                  ElevatedButton(
                    onPressed: () async {
                      await cubit.getMentalSupport();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF036666),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      fixedSize: Size(150.w, 50.h),
                    ),
                    child: Text(
                      'Finish',
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
