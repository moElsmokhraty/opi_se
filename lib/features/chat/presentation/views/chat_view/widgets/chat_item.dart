import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24.r,
          backgroundImage: const AssetImage('assets/images/avatar_image.png'),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Row(
            children: [
              Text(
                'Nada Abdel nasser',
                style: AppStyles.textStyle24.copyWith(
                  color: const Color(0xFF203140),
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(),
              Text(
                '09:30',
                style: AppStyles.textStyle12.copyWith(
                  color: const Color(0xFF8492A7),
                ),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Row(
            children: [
              Text(
                'Hi',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Container(
                width: 20.w,
                height: 20.h,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  color: Color(0xFF036666),
                  shape: OvalBorder(),
                ),
                child: Text(
                  '1',
                  style: AppStyles.textStyle12.copyWith(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
