import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xff366666).withOpacity(0.4),
                        const Color(0xff366666).withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 12.w,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.black.withOpacity(0.7),
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75.h,
            )
          ],
        ),
        Positioned(
          bottom: 11.h,
          left: 11.w,
          child: Stack(
            children: [
              Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8.w,
                  ),
                  color: const Color(0XFF9AC2C2), //by abdelaziz wal3ana
                ),
                child: CircleAvatar(
                  radius: 65.r,
                  backgroundColor: const Color(0XFF9AC2C2),
                  child: Text(
                    'MS',
                    style: AppStyles.textStyle16.copyWith(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 15.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 4.w,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
