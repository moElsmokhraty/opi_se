import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../../../../core/utils/styling/styles.dart';

class MentorHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MentorHomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  State<MentorHomeAppBar> createState() => _MentorHomeAppBarState();
}

class _MentorHomeAppBarState extends State<MentorHomeAppBar> {
  Widget notificationIcon = Icon(
    CupertinoIcons.bell_fill,
    color: const Color(0xFF036666),
    size: 24.sp,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RoutesConfig.manageProfile);
          },
          child: Row(
            children: [
              Builder(
                builder: (context) {
                  if (userCache!.profileImage != 'default.png') {
                    return CircleAvatar(
                      radius: 24.r,
                      backgroundImage: NetworkImage(userCache!.profileImage!),
                    );
                  } else {
                    return Container(
                      width: 50.w,
                      height: 50.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0XFF9AC2C2),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        userCache!.userName![0].toUpperCase() +
                            userCache!.userName![1].toUpperCase(),
                        style: AppStyles.textStyle16.copyWith(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Hi, ${userCache!.userName!.split(' ').first}',
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
                ),
              )
            ],
          ),
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
          onPressed: () {
            GoRouter.of(context).push(RoutesConfig.notifications);
          },
          tooltip: 'Notifications',
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          icon: Builder(
            builder: (context) {
              changeNotificationMark();
              return notificationIcon;
            },
          ),
        ),
      ],
    );
  }

  void changeNotificationMark() {
    if (userCache?.matchId != null) {
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
        },
      );
    }
  }
}
