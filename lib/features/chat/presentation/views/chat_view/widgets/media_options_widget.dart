import 'dart:math';
import 'package:flutter/material.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaOptionsWidget extends StatelessWidget {
  const MediaOptionsWidget({super.key, required this.cubit});

  final ChatCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cubit.showMediaOptions,
      child: Positioned(
        left: 24.w,
        bottom: 65.h,
        child: Container(
          width: 225.w,
          height: 190.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 2.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10.r,
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
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    SizedBox(width: 10.w),
                    Text('Photo & Video', style: textStyle),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.insert_drive_file,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    SizedBox(width: 10.w),
                    Text('Document', style: textStyle),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
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
    );
  }

  static TextStyle textStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: Colors.black.withOpacity(0.7),
  );
}
