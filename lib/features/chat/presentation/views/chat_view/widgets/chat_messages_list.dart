import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_bubble.dart';
import '../../../cubits/chat_cubit.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ChatCubit cubit;
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    if (state is GetChatSuccess) {
      if ((state as GetChatSuccess).messages.isEmpty) {
        return Expanded(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/no_messages.png',
                    height: 350.h,
                    width: double.infinity,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No messages yet!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: const Color(0xff036666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
          itemCount: cubit.messages.length,
          reverse: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 4.h,
          ),
          itemBuilder: (context, index) =>
              ChatBubble(message: cubit.messages[index], cubit: cubit),
        ),
      );
    } else if (state is GetChatFailure && cubit.messages.isEmpty) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no_messages.png',
                height: 350.h,
                width: double.infinity,
              ),
              SizedBox(height: 8.h),
              Text(
                (state as GetChatFailure).message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: const Color(0xff036666),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff036666),
          ),
        ),
      );
    }
  }
}
