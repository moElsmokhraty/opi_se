import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    PartnerRecommendationsCubit cubit = BlocProvider.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.025),
          Text.rich(
            textScaler: const TextScaler.linear(1.1),
            TextSpan(
              children: [
                TextSpan(
                  text: 'With',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' Opi Se ',
                  style: AppStyles.textStyle24.copyWith(
                    color: const Color(0xFF036666),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'You Can Find The Perfect Study Partner',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Welcome to our learning community! Step into a world of opportunity at Opi Se where learning is a shared journey. Start exploring, connecting, and achieving your academic goals.',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 15.sp,
              color: Colors.black.withOpacity(0.6),
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          AuthButton(
            text: 'Get a new Brain Buddy',
            onPressed: () {
              if (userCache!.matchId == null) {
                cubit.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                showCustomSnackBar(context, 'You already have a partner !');
              }
            },
            backColor: const Color(0xFF036666),
            textColor: Colors.white,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 32.w),
              Image.asset(
                'assets/images/home_asset.png',
                width: 250.w,
                height: 250.h,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 70.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: const Color(0XFFD9D9D9),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              GoRouter.of(context).push(RoutesConfig.mentalHealth);
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/mental_health.png',
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Mental Health',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/home_mentor.png',
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Mentor',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0XFF036666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  margin: EdgeInsets.only(bottom: 55.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF036666).withOpacity(0.2),
                      width: (1.5).w,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/robot.svg',
                      height: 30.h,
                      width: 30.w,
                    ),
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
