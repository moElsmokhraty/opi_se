import 'dart:math';
import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaOptionsWidget extends StatelessWidget {
  const MediaOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) => Positioned(
        left: 24.w,
        bottom: 65.h,
        child: AnimatedVisibility(
          visible: cubit.showMediaOptions,
          child: Container(
            width: 225.w,
            height: 130.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1.r,
                  spreadRadius: 1.r,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      SizedBox(width: 10.w),
                      Text('Camera', style: textStyle),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    cubit.toggleMediaOptions();
                    await cubit.pickImages();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.photo,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      SizedBox(width: 10.w),
                      Text('Photos', style: textStyle),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cubit.toggleMediaOptions();
                    cubit.togglePollOptions();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: pi / 2.0,
                        child: Icon(
                          Icons.poll_outlined,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text('Poll', style: textStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static TextStyle textStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: Colors.black.withOpacity(0.7),
  );
}
