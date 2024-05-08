import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'chat_bubble.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (userCache?.matchId == null) {
          return Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                      'You do not have a student partner yet!',
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
        if (state is GetChatLoading && cubit.messages.isEmpty) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xff036666),
              ),
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
                    state.message,
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
          if (cubit.messages.isEmpty) {
            return Expanded(
              child: Center(
                child: Text(
                  'No messages yet!',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: const Color(0xff036666),
                  ),
                ),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: cubit.messages.length,
              reverse: true,
              physics: cubit.showPollOptions
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 6.h,
              ),
              itemBuilder: (context, index) =>
                  ChatBubble(message: cubit.messages[index], cubit: cubit),
            ),
          );
        }
      },
    );
  }
}
