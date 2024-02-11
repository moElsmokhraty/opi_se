import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
          toolbarHeight: 50.h,
          leadingWidth: 75.w,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
