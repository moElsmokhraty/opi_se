import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'profile_header_widget.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/home/presentation/views/profile_view/widgets/id_widget.dart';
import 'package:opi_se/features/home/presentation/views/profile_view/widgets/profile_skills_widget.dart';
import 'package:opi_se/features/home/presentation/views/profile_view/widgets/about_me_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeaderWidget(),
          SizedBox(height: screenHeight * 0.01),
          Text(
            userCache!.userName!,
            style: AppStyles.textStyle16.copyWith(
              fontSize: 25.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            userCache!.specialization!,
            style: AppStyles.textStyle16.copyWith(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            '${userCache!.age} Years',
            style: AppStyles.textStyle16.copyWith(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            'Damanhour, Egypt',
            style: AppStyles.textStyle16.copyWith(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          const IDWidget(),
          SizedBox(height: screenHeight * 0.025),
          const AboutMeWidget(),
          SizedBox(height: screenHeight * 0.025),
          ProfileSkillsWidget(skills: userCache!.skills!),
        ],
      ),
    );
  }
}
