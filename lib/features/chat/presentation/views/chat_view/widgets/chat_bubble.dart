import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String text;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                      vertical: 6.h,
                      horizontal: 12.w,
                    ),
                    child: Text(
                      text,
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
    );
  }
}
