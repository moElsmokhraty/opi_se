import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/app_assets.dart';
import 'team_members_slider.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                AppAssets.aboutUs,
                width: double.infinity,
                height: 1405.h,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      tooltip: 'Back',
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.only(left: 20.w),
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFF036666),
                      ),
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find your perfect study partner',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFEDEBDE),
                          ),
                        ),
                        SizedBox(height: 36.h),
                        Text(
                          'Opi Se is a website that helps students find a suitable study partner with whom they can interact, share notes and tasks, and study together using our powerful recommendation system that matches people based on their skills, interests, gender and location.We produce interactive learning methods such as video calls, chat and chat sessions that have timers to provide a new experience for partners with more peer interaction.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: const Color(0XFFEDEBDE),
                          ),
                        ),
                        SizedBox(height: 160.h),
                        Stack(
                          children: [
                            Image.asset(
                              AppAssets.aboutUsSign,
                              width: 100.w,
                              height: 100.h,
                            ),
                            Container(
                              width: 1.sw,
                              padding: EdgeInsets.only(top: 55.h, left: 65.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'The largest Study Service.',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '100% Online',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0XFF036666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 70.h),
                        Text(
                          '000,000,000',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF036666),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Study Partners',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 1.h,
                          width: 395.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          '000,000,000',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF036666),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Credentialed mentors ready to help',
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 1.h,
                          width: 395.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          '000,000,000',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF036666),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Parents',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            'Our Team ',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0XFF036666),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          const TeamMembersSlider(),
          SizedBox(height: screenHeight * 0.08),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.05),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      height: 55.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(RoutesConfig.contactUs);
                      },
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFF036666),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'graduation.project.info@gmail.com ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    children: [
                      TextSpan(
                        text: ' all rights reserved.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF036666),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
