import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../../../../core/utils/styling/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    Widget notificationIcon = Icon(
      CupertinoIcons.bell_fill,
      color: const Color(0xFF036666),
      size: 24.sp,
    );
    return AppBar(
      toolbarHeight: 100.h,
      elevation: 0,
      scrolledUnderElevation: 0,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Nada',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Welcome Back!',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
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
        IconButton(
          onPressed: () {},
          tooltip: 'Notifications',
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          icon: StatefulBuilder(
            builder: (context, setState) {
              SocketService.on(
                  eventName: 'showNotificationMark',
                  handler: (eventData) {
                    setState(() {
                      notificationIcon = Stack(
                        children: [
                          Icon(
                            CupertinoIcons.bell_fill,
                            color: const Color(0xFF036666),
                            size: 24.sp,
                          ),
                          Positioned(
                            top: 8.0,
                            right: 4.0,
                            child: Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
                  });
              return notificationIcon;
            },
          ),
        ),
      ],
    );
  }
}
