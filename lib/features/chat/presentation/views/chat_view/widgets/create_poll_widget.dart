import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_visibility/animated_visibility.dart';
import 'poll_text_field.dart';
import '../../../cubits/chat_cubit/chat_cubit.dart';

class CreatePollWidget extends StatelessWidget {
  const CreatePollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatCubit cubit = BlocProvider.of<ChatCubit>(context);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Form(
          key: cubit.pollFormKey,
          child: Positioned(
            left: 24.w,
            bottom: 65.h,
            child: AnimatedVisibility(
              visible: cubit.showPollOptions,
              child: Container(
                width: 315.w,
                constraints: BoxConstraints(
                  minHeight: 200.h,
                  maxHeight: 400.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 1.r,
                      spreadRadius: 1.r,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 1.r,
                      spreadRadius: 1.r,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: cubit.scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/create_poll.png',
                            width: 35.w,
                            height: 35.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Create Poll',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      PollTextField(
                        controller: cubit.pollQuestionController,
                        hintText: 'Type your Question',
                      ),
                      SizedBox(height: 15.h),
                      PollTextField(
                        controller: cubit.pollFirstOptionController,
                        hintText: 'Option 1',
                      ),
                      SizedBox(height: 15.h),
                      ListView.separated(
                        itemCount: cubit.listOptionsController.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == cubit.listOptionsController.length - 1) {
                            return Row(
                              children: [
                                PollTextField(
                                  controller:
                                      cubit.listOptionsController[index],
                                  hintText: 'Option ${index + 2}',
                                  isLast: true,
                                ),
                                SizedBox(width: 5.w),
                                InkWell(
                                  onTap: () {
                                    cubit.addOption();
                                  },
                                  child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff036666),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: () {
                                    cubit.sendPoll();
                                  },
                                  child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff036666),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Icon(
                                      Icons.check_outlined,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              children: [
                                PollTextField(
                                  controller:
                                      cubit.listOptionsController[index],
                                  hintText: 'Option ${index + 2}',
                                ),
                                SizedBox(width: 10.w),
                                InkWell(
                                  onTap: () {
                                    cubit.removeOption(index);
                                  },
                                  child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff036666),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Icon(
                                      Icons.remove_outlined,
                                      color: Colors.white,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
