import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/no_partner_widget.dart';
import '../../../domain/use_cases/get_chat_use_case.dart';
import '../../../domain/use_cases/upload_chat_images_use_case.dart';
import 'widgets/chat_text_field.dart';
import 'widgets/chat_messages_list.dart';
import 'widgets/create_poll_widget.dart';
import '../../cubits/chat_cubit/chat_cubit.dart';
import 'widgets/media_options_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (userCache?.matchId == null) {
          return const NoPartnerWidget();
        } else {
          return BlocProvider(
            create: (context) => ChatCubit(
              getIt.get<GetChatUseCase>(),
              getIt.get<UploadChatImagesUseCase>(),
            )
              ..getChat(page: 1, limit: 20)
              ..listenOnNewMessage()
              ..listenOnMediaFromSocket()
              ..listenOnMessageDeleted()
              ..listenOnChatSessionRequest(context)
              ..listenOnReplyToSessionRequest(context)
              ..listenOnMatchRequestApproved(),
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return RefreshIndicator(
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
                );
              },
            ),
          );
        }
      },
    );
  }
}
