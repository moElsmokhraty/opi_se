import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'notification_item.dart';
import '../../../cubits/notifications_cubit/notifications_cubit.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final NotificationsCubit cubit =
            BlocProvider.of<NotificationsCubit>(context);
        if (state is GetNotificationsLoading && cubit.notifications.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        }
        if (state is GetNotificationsFailure && cubit.notifications.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_requests.png',
                  width: double.infinity,
                  height: 350.h,
                ),
                SizedBox(height: 25.h),
                Text(
                  state.failure.errMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetNotificationsSuccess &&
            cubit.notifications.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_notifications.png',
                  width: double.infinity,
                  height: 350.h,
                ),
                SizedBox(height: 25.h),
                Text(
                  'No Notifications Found',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'You don\'t have any notifications at the moment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          );
        }
        return ListView.separated(
          itemCount: cubit.notifications.length,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          itemBuilder: (context, index) => NotificationItem(
            notification: cubit.notifications[index],
          ),
          separatorBuilder: (context, index) {
            return SizedBox(height: 15.h);
          },
        );
      },
    );
  }
}
