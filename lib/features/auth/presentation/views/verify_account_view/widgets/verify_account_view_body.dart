import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class VerifyAccountViewBody extends StatelessWidget {
  const VerifyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Image.asset(
            'assets/images/verify_account.png',
            height: 350.h,
            width: width,
            alignment: Alignment.center,
          ),
          Text(
            'Check your email',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'We have just sent a verification email to your email lol@gmail.com',
            style: AppStyles.textStyle12.copyWith(fontSize: 15.sp),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.06),
          AuthButton(
            text: 'Continue',
            onPressed: () {
              GoRouter.of(context).pushReplacement(RoutesConfig.login);
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          ),
          SizedBox(height: screenHeight * 0.02),
          RichText(
            text: TextSpan(
              text: 'Didn\'t receive an email ?',
              style: AppStyles.textStyle12.copyWith(
                fontSize: 15.sp,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: ' Resend Email',
                  style: AppStyles.textStyle12.copyWith(
                    fontSize: 15.sp,
                    color: const Color(0xff036666),
                  ),
                ),
              ],
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
