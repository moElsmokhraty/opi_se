import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/notifications_services.dart';
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
          Image.asset(
            'assets/images/home_asset.png',
            width: double.infinity,
            height: 250.h,
          ),
        ],
      ),
    );
  }
}
