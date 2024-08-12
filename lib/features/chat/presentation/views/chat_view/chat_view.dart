import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_text_field.dart';
import 'widgets/chat_messages_list.dart';
import 'widgets/create_poll_widget.dart';
import '../../cubits/chat_cubit/chat_cubit.dart';
import 'widgets/media_options_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const ChatAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ChatCubit>(context).getChat();
          },
          child: const Stack(
            children: [
              Column(
                children: [
                  ChatMessagesList(),
                  ChatTextField(),
                ],
              ),
              MediaOptionsWidget(),
              CreatePollWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
