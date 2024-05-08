import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.itemCount,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final int itemCount;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      physics: physics,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Text(
              '${index + 2}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 8.w),
            Image.asset(
              'assets/images/avatar_image.png',
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 65.w,
              child: Text(
                'Username',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: 75.w,
              child: Text(
                'Specialization',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 55.w,
              child: Text(
                '100 Hours',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                '100 Coins',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0XFF036666),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 15.h);
      },
    );
  }
}
