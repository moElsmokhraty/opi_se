import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';

class LevelSlider extends StatelessWidget {
  const LevelSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final UserPrefersCubit cubit = BlocProvider.of<UserPrefersCubit>(context);
    return BlocBuilder<UserPrefersCubit, UserPrefersState>(
      builder: (context, state) => Visibility(
        visible: cubit.sliderVisible,
        child: Container(
          width: 260.w,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 10,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Text(
                'Rate this skill out of five',
                textAlign: TextAlign.center,
                style: AppStyles.textStyle24.copyWith(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.0125),
              SizedBox(
                width: 200.w,
                child: SfSlider(
                  min: 1.0,
                  max: 5.0,
                  value: cubit.skillLevel.toDouble(),
                  interval: 1,
                  showLabels: true,
                  onChanged: (newValue) {
                    cubit.setSkillLevel(newValue.toInt());
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              ElevatedButton(
                onPressed: () {
                  cubit.addSkill();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF036666),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  minimumSize: Size(120.w, 35.h),
                ),
                child: Text(
                  'Done',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
