import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/chat/data/models/get_chat_response/message.dart';

class ChatBubble extends StatelessWidget {
  final Message? message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isSender = message?.messageSender == userId;
    String? formattedDate = message?.sentAt == null
        ? ''
        : '${message?.sentAt?.hour.toString()}:${message?.sentAt?.minute.toString()} ${message!.sentAt!.hour < 12 ? 'AM' : 'PM'}';
    return Column(
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
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 16.w,
                        ),
                        child: Text(
                          message?.messageContent ?? '',
                          style: AppStyles.textStyle12.copyWith(
                            fontSize: 14.sp,
                            color: isSender ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      SizedBox(width: 1.w)
                    ],
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
                      color: Colors.grey,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(height: 16.h)
      ],
    );
  }
}
