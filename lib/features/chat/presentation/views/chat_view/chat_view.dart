import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_text_field.dart';
import 'widgets/chat_messages_list.dart';
import 'widgets/create_poll_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ChatAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 8.h),
                const ChatMessagesList(),
                const ChatTextField(),
              ],
            ),
            //const CreatePollWidget(),
          ],
        ),
      ),
    );
  }
}
