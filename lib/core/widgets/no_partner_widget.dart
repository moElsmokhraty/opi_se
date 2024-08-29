import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoPartnerWidget extends StatelessWidget {
  const NoPartnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Image.asset(
              'assets/images/no_partner.png',
              width: 350.w,
              height: 350.h,
            ),
            Text(
              'You don’t have partner yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0XFF036666),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Click on "Get Recommendations" to find a suitable partner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
