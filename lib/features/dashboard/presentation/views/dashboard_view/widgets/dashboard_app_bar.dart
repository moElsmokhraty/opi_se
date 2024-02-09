import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/styles.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 100.h,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
        child: Row(
          children: [
            Image.asset(
              'assets/images/avatar_image.png',
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(width: 10.w),
            Text(
              'Hi, ${userCache!.userName!.split(' ').first}',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(RoutesConfig.requests);
          },
          tooltip: 'Match Requests',
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          icon: Icon(
            Icons.person_add_alt_1,
            color: const Color(0xFF036666),
            size: 24.sp,
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
