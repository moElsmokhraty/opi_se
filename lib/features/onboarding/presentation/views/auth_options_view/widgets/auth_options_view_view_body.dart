import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/styling/app_assets.dart';

import '../../../../../../core/utils/routes_config/routes_config.dart';
import 'auth_option_item.dart';

class AuthOptionsViewBody extends StatelessWidget {
  const AuthOptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthOptionItem(
            text: 'Partner',
            image: AppAssets.partner,
            onTap: () {
              GoRouter.of(context).push(RoutesConfig.firstRegister);
            },
          ),
          SizedBox(height: screenHeight * 0.0425),
          AuthOptionItem(
            text: 'Mentor',
            image: AppAssets.mentor,
            onTap: () {
              GoRouter.of(context).push(RoutesConfig.mentorFirstRegister);
            },
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
