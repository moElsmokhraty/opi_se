import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';

import '../../../../../../core/utils/routes_config/routes_config.dart';

class SuccessfulChangeViewBody extends StatelessWidget {
  const SuccessfulChangeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/successful_change.png',
            height: 200.h,
            width: width,
            alignment: Alignment.center,
          ),
          Text(
            'Congratulations!',
            style: AppStyles.textStyle24.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.0125),
          Text(
            'You have Successfully updated your password, Now you can login',
            style: AppStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.06),
          AuthButton(
            text: 'Login',
            onPressed: () {
              GoRouter.of(context).pushReplacement(RoutesConfig.login);
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
