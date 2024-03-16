import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';

import '../../../../../../core/utils/constants.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(52.h);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
        if (userCache!.matchId == null) {
          return const SizedBox.shrink();
        } else {
          return AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                SizedBox(width: 8.w),
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage:
                      const AssetImage('assets/images/avatar_image.png'),
                ),
                SizedBox(width: 10.w),
                Text(
                  userCache!.partner?.userName ?? 'Partner Chat',
                  style: AppStyles.textStyle24.copyWith(
                    color: const Color(0xFF203140),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.call_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.videocam,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  cubit.startChatSession(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF27B127),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
