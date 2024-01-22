import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class CallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CallAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(52.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: double.infinity,
      leading: Row(
        children: [
          SizedBox(width: 16.w),
          const Icon(
            CupertinoIcons.clock,
            color: Color(0xff9094A0),
          ),
          SizedBox(width: 12.w),
          Text(
            '01:25:03',
            style: AppStyles.textStyle12.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.arrow_2_circlepath,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
