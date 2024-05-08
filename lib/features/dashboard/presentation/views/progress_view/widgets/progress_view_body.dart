import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'users_list.dart';
import 'study_widget.dart';
import 'badges_widget.dart';
import 'welcome_widget.dart';
import 'show_more_button.dart';
import 'top_users_widget.dart';

class ProgressViewBody extends StatelessWidget {
  const ProgressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            const WelcomeWidget(),
            SizedBox(height: 24.h),
            const StudyWidget(),
            SizedBox(height: 24.h),
            const BadgesWidget(),
            SizedBox(height: 24.h),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: const Color(0XFF036666),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Leaderboard',
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      const TopUsersWidget(),
                      SizedBox(height: 24.h),
                      SizedBox(
                        height: 390.h,
                        child: const UsersList(itemCount: 9),
                      ),
                      SizedBox(height: 12.h),
                      const ShowMoreButton(),
                    ],
                  ),
                ),
                Positioned(
                  top: 75.h,
                  right: 60.w,
                  child: SvgPicture.asset(
                    'assets/svgs/king.svg',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
