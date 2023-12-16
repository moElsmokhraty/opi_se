import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/chat_app_bar.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/widgets/chat_messages_list.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/widgets/chat_text_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
    return SafeArea(
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: const ChatAppBar(),
            body: Column(
              children: [
                SizedBox(height: 8.h),
                ChatMessagesList(cubit: cubit, state: state),
                ChatTextField(cubit: cubit),
              ],
            ),
          );
        },
      ),
    );
  }
}
