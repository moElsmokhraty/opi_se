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
      return Expanded(
        child: ListView.builder(
          itemCount: cubit.messages.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 4.h,
          ),
          itemBuilder: (context, index) => ChatBubble(
            message: cubit.messages[index],
          ),
        ),
      );
    } else if (state is GetChatFailure) {
      return Expanded(
        child: Center(
          child: Text((state as GetChatFailure).message),
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
