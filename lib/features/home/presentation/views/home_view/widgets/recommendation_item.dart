import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/user_data.dart';
import '../../../../../../core/utils/styling/styles.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: 375.w,
        height: 110.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 90.w,
              decoration: ShapeDecoration(
                color: const Color(0x66036666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                userData.userName![0] + userData.userName![1],
                style: AppStyles.textStyle16.copyWith(fontSize: 20.sp),
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      userData.userName!,
                      style: AppStyles.textStyle24.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: AppStyles.textStyle24.copyWith(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${userData.age} years',
                          style: AppStyles.textStyle24.copyWith(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 28.h,
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 10.w,
                            ),
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.w,
                                  color: const Color(0xFF036666),
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              'Take First Step',
                              style: TextStyle(
                                color: const Color(0xFF036666),
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
