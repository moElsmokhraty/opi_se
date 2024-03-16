import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../cubits/chat_media_cubit/chat_media_cubit.dart';

class ChatMediaViewBody extends StatelessWidget {
  const ChatMediaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                        size: 30.sp,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 200.h,
                      width: 200.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0XFF9AC2C2),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: userCache!.profileImage == 'default.png'
                          ? Text(
                              userCache!.userName![0] + userCache!.userName![1],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl: userCache!.profileImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const Spacer(flex: 3)
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  userCache!.userName!,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 45.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    CupertinoIcons.video_camera,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Media',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF036666),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 3.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFF036666),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: BlocBuilder<ChatMediaCubit, ChatMediaState>(
                      builder: (context, state) {
                        final ChatMediaCubit cubit =
                            BlocProvider.of<ChatMediaCubit>(context);
                        if (state is ChatMediaLoading && cubit.media.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ChatMediaFailure) {
                          return Center(
                            child: Text(
                              state.failure,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else if (cubit.media.isEmpty) {
                          return Center(
                            child: Text(
                              'No media found',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else {
                          return GridView.builder(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: cubit.media.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      cubit.media[index].mediaUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
