import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Chats',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const ChatViewBody(),
      ),
    );
  }
}
