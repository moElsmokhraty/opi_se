import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/app_assets.dart';

class ThirdOnBoarding extends StatelessWidget {
  const ThirdOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 45.sp),
      child: Column(
        children: [
          Image.asset(
            AppAssets.thirdOnboarding,
            height: 400.h,
            width: 400.w,
          ),
          Text(
            'Study Well',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Persist in your study efforts to attain your educational objectives; the challenges are fleeting',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: screenHeight * 0.152),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(
                    RoutesConfig.authOptions,
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 50.h,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    color: Color(0XFF036666),
                    shape: OvalBorder(),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 22.sp,
                    color: Colors.white,
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
