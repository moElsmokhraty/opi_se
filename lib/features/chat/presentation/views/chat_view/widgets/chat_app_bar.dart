import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/widgets/no_partner_widget.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/service_locator.dart';
import '../../../../domain/use_cases/get_chat_use_case.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../domain/use_cases/upload_chat_images_use_case.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
              final ChatCubit cubit = BlocProvider.of<ChatCubit>(context);

              return AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,
                toolbarHeight: 75.h,
                leadingWidth: 200.w,
                leading: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(RoutesConfig.chatMedia);
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 20.w),
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: CachedNetworkImageProvider(
                          userCache!.partner?.profileImage == 'default.png'
                              ? 'https://i.stack.imgur.com/l60Hf.png'
                              : userCache!.partner?.profileImage ??
                                  'https://i.stack.imgur.com/l60Hf.png',
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 120.w,
                        child: Text(
                          userCache!.partner?.userName ?? 'Partner Chat',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF000E08),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
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
            },
          ),
        );
      }
    });
  }
}
