import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import 'widgets/chat_app_bar.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../domain/use_cases/get_chat_use_case.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/widgets/chat_messages_list.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/widgets/chat_text_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        getIt.get<GetChatUseCase>(),
      )..getChat(userCache!.matchId, page: 1, limit: 10),
      child: SafeArea(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is GetChatFailure) {
              showCustomSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: userCache!.matchId != null ? const ChatAppBar() : null,
              body: Column(
                children: [
                  SizedBox(height: 8.h),
                  ChatMessagesList(
                    cubit: BlocProvider.of<ChatCubit>(context),
                    state: state,
                  ),
                  ChatTextField(cubit: BlocProvider.of<ChatCubit>(context)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
