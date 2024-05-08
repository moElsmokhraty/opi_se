import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'users_list.dart';
import 'top_users_widget.dart';

class LeaderboardDialog extends StatelessWidget {
  const LeaderboardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: const Color(0XFF036666), width: 1.w),
      ),
      child: Column(
        children: [
          Text(
            'Leaderboard',
            style: TextStyle(
              fontSize: 28.sp,
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24.w),
          const TopUsersWidget(),
          SizedBox(height: 24.w),
          const Expanded(
            child: UsersList(
              itemCount: 29,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
