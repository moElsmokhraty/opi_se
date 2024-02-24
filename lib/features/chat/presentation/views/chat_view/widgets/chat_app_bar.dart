import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

import '../../../../../../core/utils/constants.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(52.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage('assets/images/avatar_image.png'),
          ),
          SizedBox(width: 10.w),
          Text(
            userCache!.partner?.userName ?? 'Partner Chat',
            style: AppStyles.textStyle24.copyWith(
              color: const Color(0xFF203140),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            Icons.call_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.videocam,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
