import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_bubble.dart';
import 'chat_text_field.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            itemBuilder: (context, index) => const ChatBubble(
              text: 'Hello',
              isSender: false,
            ),
          ),
        ),
        const ChatTextField(),
      ],
    );
  }
}
