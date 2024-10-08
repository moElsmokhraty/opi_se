import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.paperclip, size: 24.sp),
            color: const Color(0XFF000E08).withOpacity(0.5),
            onPressed: () {
              cubit.toggleMediaOptions();
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6F6),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: TextField(
                enabled: userCache!.matchId != null,
                controller: cubit.messageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  hintText: 'Type a message',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    color: const Color(0XFF000E08).withOpacity(0.5),
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.sendMessage();
            },
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.send,
              color: const Color(0XFF000E08).withOpacity(0.5),
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
