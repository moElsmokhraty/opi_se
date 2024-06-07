import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(65.h);

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
            toolbarHeight: 65.h,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 48.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: CachedNetworkImageProvider(
                      userCache!.partner!.profileImage == 'default.png'
                          ? 'https://i.stack.imgur.com/l60Hf.png'
                          : userCache!.partner!.profileImage ?? 'https://i.stack.imgur.com/l60Hf.png',
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 115.w,
                    child: Text(
                      userCache!.partner?.userName ?? 'Partner Chat',
                      maxLines: 2,
                      style: AppStyles.textStyle24.copyWith(
                        color: const Color(0xFF203140),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios_outlined),
              onTap: () {
                GoRouter.of(context).pop();
              },
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
