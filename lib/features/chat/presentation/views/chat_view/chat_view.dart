import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/chat_view_body.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 36.w,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(
                  'assets/images/avatar_image.png',
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Nada Abdel nasser',
                style: AppStyles.textStyle24.copyWith(
                  color: const Color(0xFF203140),
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
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
        ),
        body: const ChatViewBody(),
      ),
    );
  }
}
