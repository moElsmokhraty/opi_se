import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
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
                  text: 'You\nCan Find The\nPerfect Study Partner',
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
            'Lorem ipsum dolor sit amet, consectetur elit, sed nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velitesse cillum dolore eu fugiat nulla',
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
            onPressed: () {},
            backColor: const Color(0xFF036666),
            textColor: Colors.white,
          ),
          Image.asset(
            'assets/images/home_asset.png',
            width: double.infinity,
            height: 225.h,
          ),
        ],
      ),
    );
  }
}
