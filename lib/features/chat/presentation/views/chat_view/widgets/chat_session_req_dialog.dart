import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/features/chat/domain/use_cases/get_chat_use_case.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';

import '../../../../domain/use_cases/upload_chat_images_use_case.dart';

class ChatSessionReqDialog extends StatelessWidget {
  const ChatSessionReqDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        getIt.get<GetChatUseCase>(),
        getIt.get<UploadChatImagesUseCase>(),
      ),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
          return AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            content: Text(
              '${userCache!.partner?.userName} sent you a chat session request!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Inter',
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                    ),
                    onPressed: () {
                      cubit.replyToSessionRequest(false, context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                    ),
                    onPressed: () {
                      cubit.replyToSessionRequest(true, context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
