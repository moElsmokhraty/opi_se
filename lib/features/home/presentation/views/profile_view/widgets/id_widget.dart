import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/styling/styles.dart';

class IDWidget extends StatelessWidget {
  const IDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      padding: EdgeInsets.only(left: 20.w, right: 15.w),
      child: Stack(
        children: [
          SizedBox(
            height: 60.h,
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Text(
                    'Id:',
                    style: AppStyles.textStyle24.copyWith(
                      fontSize: 18.sp,
                      height: 0.08,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'https://opi-se.vercel.app/profile?userid=${userCache!.id!}',
                    style: AppStyles.textStyle12.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                      height: 0.15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0.w,
            bottom: 20.h,
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: 'https://opi-se.vercel.app/profile?userid=${userCache!.id!}'));
                showCustomSnackBar(context, 'Copied to clipboard');
              },
              child: Icon(
                Icons.copy_rounded,
                color: Colors.black.withOpacity(0.7),
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
