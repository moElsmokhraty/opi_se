import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import '../../../../../../core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/chat/data/models/get_chat_response/message.dart';

class ChatBubble extends StatelessWidget {
  final Message? message;
  final ChatCubit cubit;

  const ChatBubble({super.key, required this.message, required this.cubit});

  @override
  Widget build(BuildContext context) {
    bool isSender = message?.messageSender == userCache!.id!;
    String? formattedDate = message?.sentAt == null
        ? ''
        : '${message?.sentAt?.hour.toString()}:${message?.sentAt?.minute.toString()} ${message!.sentAt!.hour < 12 ? 'AM' : 'PM'}';
    return GestureDetector(
      onLongPress: () {
        if (message?.messageSender != userCache!.id) {
          return;
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Delete Message'),
                content: const Text(
                  'Are you sure you want to delete this message?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.deleteMessage(message!);
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              isSender
                  ? Expanded(child: SizedBox(width: 5.w))
                  : const SizedBox.shrink(),
              Container(
                color: Colors.transparent,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.95,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSender
                          ? const Color(0xFF366666)
                          : const Color(0XFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14.r),
                        bottomRight: Radius.circular(14.r),
                        topLeft: Radius.circular(isSender ? 14.r : 0),
                        topRight: Radius.circular(isSender ? 0 : 14.r),
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (message?.messageType == 'text') {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 16.w),
                            child: Text(
                              message?.messageContent ?? '',
                              style: AppStyles.textStyle12.copyWith(
                                fontSize: 14.sp,
                                color: isSender ? Colors.white : Colors.black,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                            ),
                          );
                        } else if (message?.messageType == 'media') {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 4.w),
                            child: CachedNetworkImage(
                              alignment: Alignment.center,
                              imageUrl: message?.mediaUrl ?? '',
                              width: 270.w,
                              height: 200.h,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: AppStyles.textStyle12.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5.w),
                isSender
                    ? const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.blueAccent,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: 16.h)
        ],
      ),
    );
  }
}
