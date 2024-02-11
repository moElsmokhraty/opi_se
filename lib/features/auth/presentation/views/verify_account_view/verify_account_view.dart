import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/verify_account_view/widgets/verify_account_view_body.dart';

import '../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../core/utils/styling/styles.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(
          actions: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement(RoutesConfig.login);
              },
              child: Text(
                'Skip',
                style: AppStyles.textStyle12.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: VerifyAccountViewBody(email: email),
      ),
    );
  }
}
