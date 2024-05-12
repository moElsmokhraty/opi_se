import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/app_assets.dart';

import 'auth_option_item.dart';

class AuthOptionsViewBody extends StatelessWidget {
  const AuthOptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    /// TODO: Implement Navigation to the respective sign up page
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Sign Up as:',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 35.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.065),
          AuthOptionItem(
            text: 'Partner',
            image: AppAssets.partner,
            onTap: () {},
          ),
          SizedBox(height: screenHeight * 0.0425),
          AuthOptionItem(
            text: 'Mentor',
            image: AppAssets.mentor,
            onTap: () {},
          ),
          SizedBox(height: screenHeight * 0.0425),
          AuthOptionItem(
            text: 'Parents',
            image: AppAssets.parents,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
