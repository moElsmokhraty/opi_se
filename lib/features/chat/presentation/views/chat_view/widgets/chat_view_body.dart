import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_item.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      itemBuilder: (context, index) => const ChatItem(),
    );
  }
}
