import 'package:flutter/material.dart';
import 'widgets/chat_media_view_body.dart';

class ChatMediaView extends StatelessWidget {
  const ChatMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF5F5F5),
        body: ChatMediaViewBody(),
      ),
    );
  }
}
