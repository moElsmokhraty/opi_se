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
        if (state is GetNotificationsLoading &&
            cubit.notifications.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        }
        if (state is GetNotificationsFailure &&
            cubit.notifications.isEmpty) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red,
                fontFamily: 'Inter',
              ),
            ),
          );
        } else if (state is GetNotificationsSuccess &&
            cubit.notifications.isEmpty) {
          return Center(
            child: Text(
              'No Notifications Available',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red,
                fontFamily: 'Inter',
              ),
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
